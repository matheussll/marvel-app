//
//  CharactersCoordinator.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

class CharactersCoordinator: Coordinator {
    private let presenter: UINavigationController
    var charactersViewController: CharactersViewController?
    private var characterDetailCoordinator: CharacterDetailCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let charactersViewController = CharactersViewController(nibName: nil, bundle: nil)
        charactersViewController.title = "MARVEL"
        let charactersViewModel = CharactersViewModel(delegate: charactersViewController)
        charactersViewModel.coordinatorDelegate = self
        charactersViewController.viewModel = charactersViewModel
        presenter.pushViewController(charactersViewController, animated: true)
        self.charactersViewController = charactersViewController
    }
}

extension CharactersCoordinator: CharactersViewModelCoordinatorDelegate {
    func charactersViewModelDidSelectCharacter(_ character: Character) {
        let characterDetailCoordinator = CharacterDetailCoordinator(presenter: presenter, character: character)
        characterDetailCoordinator.start()
        self.characterDetailCoordinator = characterDetailCoordinator
    }
}
