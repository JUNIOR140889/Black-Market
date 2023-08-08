//
//  StringExtension.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/25/23.
//
import SwiftUI

extension String {
    var isValidEmail: Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) != nil
    }
    
    var isValidPassword: Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&+-]{8,}$", options: [])
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) != nil
    }
}
