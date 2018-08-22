//
//  UIFont+AppFont.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

extension UIFont {
    static func appFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Trebuchet MS", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
