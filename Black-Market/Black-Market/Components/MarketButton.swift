//
//  MarketButton.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI

struct MarketButton: View {
    @Binding var style: Style
    private let action: () -> Void
    private let title: String
        
    enum Style {
        case filled
        case disabled
        case plain
    }
    
    init(
        style: Binding<Style> = .constant(.plain),
        action: @escaping () -> Void,
        title: String
    ) {
        self._style = style
        self.action = action
        self.title = title
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .applyButtonStyle(style)
        }
        .disabled(style == .disabled)
    }
}

struct FilledButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: UIConstants.Defaults.maxHeight)
            .background(Color.blackStyle)
            .foregroundColor(.white)
            .cornerRadius(UIConstants.Defaults.cornerRadius)
    }
}

struct PlainButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: UIConstants.Defaults.maxHeight)
            .background(.clear)
            .foregroundColor(.blackStyle)
            .overlay(RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius)
                .stroke(Color.blackStyle, lineWidth: UIConstants.Defaults.lineWidth))
    }
}

struct DisableButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: UIConstants.Defaults.maxHeight)
            .background(Color.lightGrey)
            .foregroundColor(.darkGrayStyle)
            .cornerRadius(UIConstants.Defaults.cornerRadius)
    }
}
