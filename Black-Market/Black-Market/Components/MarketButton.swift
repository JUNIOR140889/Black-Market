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
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color("BlackStyle"))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct PlainButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(.clear)
            .foregroundColor(Color("BlackStyle"))
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color("BlackStyle"), lineWidth: 1))
    }
}

struct DisableButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color("LightGreyStyle"))
            .foregroundColor(Color("DarkGrayStyle"))
            .cornerRadius(8)
    }
}
