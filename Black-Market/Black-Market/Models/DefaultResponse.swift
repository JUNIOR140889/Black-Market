//
//  DefaultResponse.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation

struct DefaultResponse: Codable {
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
      case success
    }
}
