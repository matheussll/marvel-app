//
//  Characters.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

struct Characters: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case data
        case offset
        case limit
        case total
        case count
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        offset = try data.decode(Int.self, forKey: .offset)
        limit = try data.decode(Int.self, forKey: .limit)
        total = try data.decode(Int.self, forKey: .total)
        count = try data.decode(Int.self, forKey: .count)
        results = try data.decode([Character].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var data = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        try data.encode(offset, forKey: .offset)
        try data.encode(limit, forKey: .limit)
        try data.encode(total, forKey: .total)
        try data.encode(count, forKey: .count)
        try data.encode(results, forKey: .results)
    }
}
