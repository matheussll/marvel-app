//
//  Thumbnail.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    let type: String
    let path: String
    
    enum CodingKeys: String, CodingKey {
        case type = "extension"
        case path
    }
}
