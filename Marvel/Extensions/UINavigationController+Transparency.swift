//
//  UINavigationController+Transparency.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit
extension UINavigationController {
    func setNavigationBarTransparent(transparent: Bool, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.33 : 0, animations: {
            if transparent {
                self.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationBar.shadowImage = UIImage()
                self.navigationBar.isTranslucent = true
                self.view.backgroundColor = .clear
                self.navigationBar.backgroundColor = .clear
            } else {
                self.navigationBar.setBackgroundImage(nil, for: .default)
                self.navigationBar.barTintColor = .marvelRed
                self.navigationBar.backgroundColor = .marvelRed
                self.view.backgroundColor = .marvelRed
                self.navigationBar.isTranslucent = false
                self.navigationBar.shadowImage = nil
            }
        })
    }
}

