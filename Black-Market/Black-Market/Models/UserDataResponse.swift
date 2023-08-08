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
    let profilePicture: URL
    let birthDate: Date
    let notificationsEnabled: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decode(String.self, forKey: .name)
        
        let profilePictureString = try container.decode(String.self, forKey: .profilePicture)
        if let profilePicture = URL(string: profilePictureString) {
            self.profilePicture = profilePicture
        } else {
            throw DecodingError.dataCorruptedError(forKey: .profilePicture, in: container, debugDescription: "profile picture url error")
        }
        
        let dateString = try container.decode(String.self, forKey: .birthDate)
        if let date = Date.date(from: dateString, and: .defaultDate) {
            self.birthDate = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .birthDate, in: container, debugDescription: "date format mismatch")
        }
        self.notificationsEnabled = try container.decode(Bool.self, forKey: .notificationsEnabled)
    }
}
