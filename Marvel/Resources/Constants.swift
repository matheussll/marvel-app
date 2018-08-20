//
//  Constants.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

fileprivate let key = "5a72d5f7ba15284dfa8a2bf58691c8aa"
fileprivate let pkey = "73314080bc75e11b8429c4b771e092063a995871"
fileprivate let timestamp = Int(NSDate().timeIntervalSince1970)
fileprivate let hash = (String(timestamp)+pkey+key).MD5

struct K {
    static let baseURL = "https://gateway.marvel.com:443/v1/public"
    static let encodingParams: [String: Any] = [
        "apikey": key,
        "ts": timestamp,
        "hash": hash
    ]
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
