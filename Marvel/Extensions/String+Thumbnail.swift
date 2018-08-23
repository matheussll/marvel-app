//
//  String+Thumbnail.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 21/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
extension String {
    var parsedThumbnail: (path: String, type: String) {
        guard let range = self.range(of: ".", options: .backwards) else {
            return ("","")
        }
        
        let type = String(self[range.upperBound...])
        let path = String(self[...range.lowerBound].dropLast())
        return (path, type)
    }
}
