//
//  CharacterDetailStickyHeader.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

class CharacterDetailStickyHeader: GSKStretchyHeaderView {
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var overlayView: UIView!
    override func awakeFromNib() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        self.contentView.backgroundColor = .marvelRed
        self.expansionMode = .topOnly
        self.minimumContentHeight = 44 + statusBarHeight
        self.maximumContentHeight = 196 + statusBarHeight
    }

    override func didChangeStretchFactor(_ stretchFactor: CGFloat) {
        var alpha = CGFloatTranslateRange(stretchFactor, 0.2, 0.8, 0, 1)
        alpha = max(0, min(1, alpha))
        self.characterImageView?.alpha = alpha
        self.overlayView?.alpha = alpha
        let navTitleFactor: CGFloat = 0.4
        var navTitleAlpha: CGFloat = 0.0
        if stretchFactor < navTitleFactor {
            navTitleAlpha = CGFloatTranslateRange(stretchFactor, 0, navTitleFactor, 1, 0);
        }
        self.characterNameLabel?.alpha = navTitleAlpha;
    }
}
