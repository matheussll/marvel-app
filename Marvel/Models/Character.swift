//
//  Character.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: Double
    let name: String
    let description: String
    let modified: String
    let resourceURI: String
}
