//
//  SignUpEndpoint.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct SignUpEndpoint: NetworkEndpoint {
    let params: [String: Any]
    
    init(params: SignUpRequest) {
        self.params = [
            "email": params.email,
            "password1": params.password,
            "password2": params.confirmedPassword
        ]
    }
    
    var absoluteURLString: String {
        baseURLString + "dj-rest-auth/registration"
    }
    
    var httpMethod: HTTPMethod {
        .post
    }
}
