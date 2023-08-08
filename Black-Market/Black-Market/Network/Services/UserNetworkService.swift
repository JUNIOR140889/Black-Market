//
//  UserService.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation
import Combine

class UserNetworkService: NetworkService, UserNetworkInterface {
    func signUp(params: SignUpRequest) -> AnyPublisher<DefaultResponse, Error> {
        getData(from: SignUpEndpoint(params: params))
            .decode(as: DefaultResponse.self)
            .eraseToAnyPublisher()
    }
    
    func signIn(params: SignInRequest) -> AnyPublisher<UserDataResponse, Error> {
        getData(from: SignInEndpoint(params: params))
            .decode(as: UserDataResponse.self)
            .eraseToAnyPublisher()
    }
}
