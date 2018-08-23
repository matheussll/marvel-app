//
//  CharactersAPI.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
import Alamofire

extension APIClient {
    static func characters(offset: Int, completion:@escaping (Result<Characters>) -> Void) {
        performRequest(route: CharactersRoutes.list(offset: offset), completion: completion)
    }
}
