//
//  TabBarItem.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/10/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, iconXYZ, cart, favorites, menu
    
    var iconName: String {
        switch self {
        case .home: "Home"
        case .iconXYZ: "IconXYZ"
        case .cart: "Cart"
        case .favorites: "Favorites"
        case .menu: "Menu"
        }
    }
    
    var color: Color {
        switch self {
        case .home: .blue
        case .iconXYZ: .red
        case .cart: .green
        case .favorites: .orange
        case .menu: .black
        }
    }
}
