//
//  SignUpRequest.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/7/23.
//

struct SignUpRequest: Encodable {
    let email: String
    let password: String
    let confirmedPassword: String
}
