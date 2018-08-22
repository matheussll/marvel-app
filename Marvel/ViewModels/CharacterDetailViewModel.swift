//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
class CharacterDetailViewModel {
    private var character: Character!
    
    init(character: Character) {
        self.character = character
    }
    
    var characterName: String {
        return character.name
    }
    
    var characterImageUrl: String {
        return character.thumbnail
    }
    
    var comicsCount: Int {
        return character.comics.count
    }
    
    var characterDescription: String {
        return character.description
    }
    
    func characterComic(at index: Int) -> Comic {
        return character.comics[index]
    }
}
