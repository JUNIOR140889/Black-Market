//
//  JSONEncodingExtension.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/7/23.
//

import Foundation
import Combine

extension JSONDecoder {
    static let snakeCaseConverting: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
