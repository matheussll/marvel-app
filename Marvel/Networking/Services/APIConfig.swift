//
//  APIConfig.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfig: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension APIConfig {
    func asURLRequest() throws -> URLRequest {
        let url = try K.baseURL.asURL()
        
        let encoding = URLEncoding.queryString
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        urlRequest.httpMethod = method.rawValue
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                urlRequest = try encoding.encode(urlRequest, with: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print(urlRequest)
        return urlRequest
    }
}

