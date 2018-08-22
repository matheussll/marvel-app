//
//  AppCoordinator.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let charactersCoordinator: CharactersCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = AppNavigationController()
        charactersCoordinator = CharactersCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        charactersCoordinator.start()
        window.makeKeyAndVisible()
    }
}
