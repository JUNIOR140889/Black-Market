//
//  NetworkEndpoint.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

protocol NetworkEndpoint {
    var baseURLString: String { get }
    var absoluteURLString: String { get }
    var httpMethod: HTTPMethod { get }
    var params: [String: Any] { get }
    var headers: [String: String] { get }
}

extension NetworkEndpoint {
    var baseURLString: String {
        Bundle.main.object(forInfoDictionaryKey: "Base URL") as? String ?? ""
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var headers: [String: String] {
        NetworkConstants.headers
    }
}
