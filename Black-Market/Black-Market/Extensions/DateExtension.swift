//
//  DateExtension.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/7/23.
//

import Foundation

enum DateFormat: String {
    case defaultDate = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension Date {
    static func date(
        from stringDate: String?,
        and dateFormat: DateFormat = .defaultDate
    ) -> Date? {
        guard let stringDate = stringDate else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.date(from: stringDate)
    }
}
