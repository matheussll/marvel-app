//
//  CharacterCellViewModel.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

struct CharacterCellViewModel {
    let nameText: String
    let numberOfSongsText: String
    let yearText: String
    let imageUrl: String
    
    init() {
        self.nameText = ""
        self.numberOfSongsText = ""
        self.yearText = ""
        self.imageUrl = ""
    }
    
    init(name: String, numberOfSongsText: String, yearText: String, imageUrl: String) {
        self.nameText = name
        self.numberOfSongsText = numberOfSongsText
        self.yearText = yearText
        self.imageUrl = imageUrl
    }
}
