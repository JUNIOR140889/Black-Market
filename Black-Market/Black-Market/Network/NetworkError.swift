//
//  NetworkError.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

enum NetworkError: Error {
    case parsing(description: String)
    case network(description: String)
    
    var text: String {
        switch self {
        case .parsing(let description):
            return description
        case .network(let description):
            return description
        }
    }
}
