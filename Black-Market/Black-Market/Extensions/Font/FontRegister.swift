//
//  FontRegister.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/27/23.
//

import SwiftUI

enum RegisterFontError: Error {
  case invalidFontFile
  case fontPathNotFound
  case initFontError
  case registerFailed
}

extension Font {
  static func registerFont(
    fontName: String,
    fontExtension: String
  ) throws {
    guard let fontURL = Bundle.main.url(
      forResource: fontName,
      withExtension: fontExtension
    ) else {
      throw RegisterFontError.fontPathNotFound
    }
    
    guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
      throw RegisterFontError.invalidFontFile
    }
    
    guard let font = CGFont(fontDataProvider) else {
      throw RegisterFontError.initFontError
    }
    
    var error: Unmanaged<CFError>?
    let success = CTFontManagerRegisterGraphicsFont(font, &error)
    guard success else {
      throw RegisterFontError.registerFailed
    }
  }
  
  static func registerFonts() {
    do {
      try FontStyle.allCases.forEach {
          try Font.registerFont(fontName: $0.rawValue, fontExtension: ".ttf")
      }
    } catch {
      print("Error")
    }
  }
}

