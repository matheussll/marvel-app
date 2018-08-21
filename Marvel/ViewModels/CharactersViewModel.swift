//
//  CharactersViewModel.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

protocol CharactersViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class CharactersViewModel {
    private weak var delegate: CharactersViewModelDelegate?

    private var characters: [Character] = []
    private var currentOffset = 0
    private var total = 0
    private var isFetchInProgress = false
    
    init(delegate: CharactersViewModelDelegate) {
        self.delegate = delegate
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return characters.count
    }
    
    func character(at index: Int) -> Character {
        return characters[index]
    }
    
    func fetchCharacters() {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        
        APIClient.characters(offset: currentOffset) { result in
            switch result {
                
            case .success(let response):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    
                    self.currentOffset += response.count
                    self.total = response.total
                    self.characters.append(contentsOf: response.results)
                    
                    if response.offset > 0 {
                        let indexPathsToReload = self.calculateIndexPathsToReload(from: response.results)
                        self.delegate?.onFetchCompleted(with: indexPathsToReload)
                    } else {
                        self.delegate?.onFetchCompleted(with: .none)
                    }
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.localizedDescription)
                }
            }
        }
    }
    
    private func calculateIndexPathsToReload(from newCharacters: [Character]) -> [IndexPath] {
        let startIndex = characters.count - newCharacters.count
        let endIndex = startIndex + newCharacters.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}
