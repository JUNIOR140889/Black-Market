//
//  UIViewExtension.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/17/23.
//

import SwiftUI

extension View {
    func handleTappableLinks() -> some View {
        modifier(LinkNavigation())
    }
    
    func applyButtonStyle(_ style: MarketButton.Style) -> some View {
        switch style {
        case .filled:
            return AnyView(modifier(FilledButtonStyle()))
        case .disabled:
            return AnyView(modifier(DisableButtonStyle()))
        case .plain:
            return AnyView(modifier(PlainButtonStyle()))
        }
    }
}
