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
    
    // MARK: - Routes
    case list()
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
            default: return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
            case .list: return "/characters"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
            case .list: return K.encodingParams
        }
    }
}
