//
//  CharactersRoutes.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
import Alamofire

enum CharactersRoutes: APIConfig {
    
    case list(offset: Int)
    
    var method: HTTPMethod {
        switch self {
            default: return .get
        }
    }
    
    var path: String {
        switch self {
            case .list: return "/characters"
        }
    }
    
    var parameters: Parameters? {
        switch self {
            case .list(let offset):
                var params : [String: Any] = ["offset": offset, "limit": 100]
                params.merge(K.encodingParams) { (current, _) in current }
                return params
        }
    }
}
