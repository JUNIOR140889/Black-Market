//
//  UserNetworkInterface.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//
import Foundation
import Combine

protocol UserNetworkInterface {
    func signUp(params: SignUpRequest) -> AnyPublisher<DefaultResponse, Error>
    func signIn(params: [String: Any]) -> AnyPublisher<UserDataResponse, Error>
}
