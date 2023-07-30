//
//  FontStyle.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/27/23.
//
import SwiftUI

enum FontSize: CGFloat {
    case size10 = 10
    case size12 = 12
    case size14 = 14
    case size16 = 16
    case size18 = 18
    case size20 = 20
    case size24 = 24
    case size32 = 32
    case size60 = 60
}

enum FontStyle: String, CaseIterable {
    case boldItalic = "DMSans-BoldItalic"
    case bold = "DMSans-Bold"
    case italic = "DMSans-Italic"
    case medium = "DMSans-Medium"
    case mediumItalic = "DMSans-MediumItalic"
    case regular = "DMSans-Regular"
}

extension Font {
    static func principal(size: FontSize, style: FontStyle) -> Font {
        Font.custom(style.rawValue, size: size.rawValue)
    }
    
    static func boldItalic(_ size: FontSize) -> Font {
        principal(size: size, style: .boldItalic)
    }
    
    static func bold(_ size: FontSize) -> Font {
        principal(size: size, style: .bold)
    }
    
    static func italic(_ size: FontSize) -> Font {
        principal(size: size, style: .italic)
    }
    
    static func medium(_ size: FontSize) -> Font {
        principal(size: size, style: .medium)
    }
    
    static func mediumItalic(_ size: FontSize) -> Font {
        principal(size: size, style: .mediumItalic)
    }
    
    static func regular(_ size: FontSize) -> Font {
        principal(size: size, style: .regular)
    }
}
