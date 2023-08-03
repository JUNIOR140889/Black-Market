//
//  UserResponse.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct UserDataResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let user: UserModel
    
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case user
    }
}

struct UserModel: Codable {
    let id: Int
    let email: String
    let name: String
    let profilePicture: String
    let birthDate: String
    let notificationsEnabled: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name
        case profilePicture = "profile_picture"
        case birthDate = "birth_date"
        case notificationsEnabled = "notifications_enabled"
    }
}
