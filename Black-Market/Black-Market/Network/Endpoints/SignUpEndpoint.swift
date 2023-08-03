//
//  SignUpEndpoint.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct SignUpEndpoint: NetworkEndpoint {
    let params: [String: Any]
    
    init(params: [String: Any]) {
        self.params = params
    }
    
    var absoluteURL: String {
        baseURL + "dj-rest-auth/registration"
    }
    
    var httpMethod: HTTPMethod {
        HTTPMethod.post
    }
}
