//
//  Constants.swift
//  Marvel
//
//  Created by Matheus Stefanello Luz on 20/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import Foundation

fileprivate func getPlistValue(_ value: String) -> Any {
    guard let plist = Bundle.main.infoDictionary, let plistValue = plist[value] else {
        return ""
    }
    return plistValue
}

fileprivate let key = getPlistValue("MarvelPublicKey") as? String ?? ""
fileprivate let pkey = getPlistValue("MarvelPrivateKey") as? String ?? ""
fileprivate let timestamp = Int(NSDate().timeIntervalSince1970)
fileprivate let hash = (String(timestamp)+pkey+key).MD5

struct K {
    static let baseURL = "https://gateway.marvel.com:443/v1/public"
    static var encodingParams: [String: Any] = [
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
