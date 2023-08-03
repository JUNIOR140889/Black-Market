//
//  UserService.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation
import Combine

class UserNetworkService: NetworkService, UserNetworkInterface {
    func signUp(params: [String : Any]) -> AnyPublisher<DefaultResponse, Error> {
        getData(from: SignUpEndpoint(params: params))
            .decode(type: DefaultResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func signIn(params: [String : Any]) -> AnyPublisher<UserDataResponse, Error> {
        getData(from: SignInEndpoint(params: params))
            .decode(type: UserDataResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
