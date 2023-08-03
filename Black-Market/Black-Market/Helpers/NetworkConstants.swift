//
//  NetworkConstants.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct NetworkConstants {
    static var headers: [String: String] {
        [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
    static let accessTokenKey = "access-token"
    static let uidKey = "uid"
    static let clientKey = "client"
}
