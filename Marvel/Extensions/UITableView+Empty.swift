//
//  UITableView+Empty.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 23/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String, offset: CGFloat) {
        
        let view = EmptyView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        view.labelOffsetConstraint.constant = offset
        view.emptyLabel?.text = message
        view.emptyLabel.textColor = .darkGray
        view.backgroundColor = .clear
        view.sizeToFit()

        self.backgroundView = view;
        self.separatorStyle = .none;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
