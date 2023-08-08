//
//  PublisherExtension.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/7/23.
//

import Foundation
import Combine

extension Publisher where Output == Data {
    func decode<T: Decodable>(
        as type: T.Type = T.self,
        using decoder: JSONDecoder = .snakeCaseConverting
    ) -> Publishers.Decode<Self, T, JSONDecoder> {
        decode(type: type, decoder: decoder)
    }
}
