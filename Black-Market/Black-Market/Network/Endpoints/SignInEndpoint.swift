//
//  SessionEndpoint.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct SignInEndpoint: NetworkEndpoint {
    let params: [String: Any]
    
    init(params: SignInRequest) {
        self.params = [
            "email": params.email,
            "password": params.password
        ]
    }
    
    var absoluteURLString: String {
        baseURLString + "dj-rest-auth/login/"
    }
    
    var httpMethod: HTTPMethod {
        .post
    }
}
