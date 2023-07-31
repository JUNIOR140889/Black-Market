//
//  Black_MarketApp.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI

@main
struct Black_MarketApp: App {
    
    init() {
        Font.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
