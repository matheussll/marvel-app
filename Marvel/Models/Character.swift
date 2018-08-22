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
    let thumbnail: String
    let comics: [Comic]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case items
        case path
        case type = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Double.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        let nestedComics = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .comics)
        comics = try nestedComics.decode([Comic].self, forKey: .items)
        let thumb = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        let path = try thumb.decode(String.self, forKey: .path)
        let type = try thumb.decode(String.self, forKey: .type)
        thumbnail = path + "." + type
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(thumbnail, forKey: .thumbnail)
        var nestedComics = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .comics)
        try nestedComics.encode(comics, forKey: .items)
        var thumb = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        try thumb.encode(thumbnail.parsedThumbnail.path, forKey: .path)
        try thumb.encode(thumbnail.parsedThumbnail.type, forKey: .type)
    }
}
