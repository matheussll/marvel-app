//
//  CharacterDetailCoordinator.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

class CharacterDetailCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var characterDetailViewController: CharacterDetailViewController?
    private var character: Character
    
    init(presenter: UINavigationController, character: Character) {
        self.presenter = presenter
        self.character = character
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(nibName: nil, bundle: nil)
        let characterDetailViewModel = CharacterDetailViewModel(character: self.character)
        characterDetailViewController.viewModel = characterDetailViewModel
        presenter.pushViewController(characterDetailViewController, animated: true)
        self.characterDetailViewController = characterDetailViewController
    }
}
