//
//  AppNavigationController.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = .marvelRed
        self.navigationBar.tintColor = .white
        self.navigationBar.isTranslucent = false
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.appFont(size: 16)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        UIBarButtonItem.appearance().setTitleTextAttributes(attrs, for: UIControlState.normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
