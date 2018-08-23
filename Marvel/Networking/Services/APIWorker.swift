//
//  APIWorker.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation
import Alamofire

typealias JsonObject = [String: Any]

enum Json {
    case object(_: JsonObject)
    case array(_: [JsonObject])
    
    init?(json: Any) {
        if let object = json as? JsonObject {
            self = .object(object)
            return
        }
        if let array = json as? [JsonObject] {
            self = .array(array)
            return
        }
        return nil
    }
}

protocol NetworkRequest {
    static func performRequest<Json:Decodable>(route: APIConfig, decoder: JSONDecoder, completion:@escaping (Result<Json>)->Void) -> DataRequest
}

class APIClient: NetworkRequest {
    @discardableResult
    static func performRequest<Json:Decodable>(route: APIConfig, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<Json>)->Void) -> DataRequest {
        return Alamofire.request(route)
            .responseJSONDecodable (decoder: decoder){ (response: DataResponse<Json>) in
                completion(response.result)
        }
    }
}
