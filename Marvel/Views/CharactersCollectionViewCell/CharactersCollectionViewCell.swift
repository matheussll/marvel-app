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

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: .none)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 6
        self.activityIndicator.hidesWhenStopped = true
    }

    func configure(with character: Character?) {
        if let character = character {
            self.nameLabel?.text = character.name
            self.nameLabel.alpha = 1
            self.nameBackgroundView.alpha = 1
            self.activityIndicator.stopAnimating()
            
            let url = URL(string: character.resourceURI)
            self.characterImageView.kf.indicatorType = .activity
            self.characterImageView?.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        } else {
            characterImageView.alpha = 0
            nameLabel.alpha = 0
            nameBackgroundView.alpha = 0
            activityIndicator.startAnimating()
        }
    }
}
