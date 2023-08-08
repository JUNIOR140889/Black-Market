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
}

struct UserModel: Codable {
    let id: Int
    let email: String
    let name: String
    let nickname: String
    let profilePicture: URL?
    let birthDate: Date?
    let notificationsEnabled: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decode(String.self, forKey: .name)
        self.nickname = try container.decode(String.self, forKey: .nickname)
        
        let profilePictureString = try container.decode(String.self, forKey: .profilePicture)
        self.profilePicture = URL(string: profilePictureString)
        
        let dateString = try? container.decode(String?.self, forKey: .birthDate)
        self.birthDate = Date.date(from: dateString, and: .defaultDate)

        self.notificationsEnabled = try container.decode(Bool.self, forKey: .notificationsEnabled)
    }
}
