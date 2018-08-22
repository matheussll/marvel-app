//
//  CharactersCollectionViewCell.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }

    func configure(with character: Character) {
        self.nameLabel?.text = character.name

        let url = URL(string: character.thumbnail)
    
        self.characterImageView.kf.indicatorType = .activity
        self.characterImageView?.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
