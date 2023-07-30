//
//  MarketTexfield.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/12/23.
//

import SwiftUI

struct MarketTextFieldStyle: TextFieldStyle {
    @Binding var style: Style
    @State var showPassword = false
    private let title: String?
    @Binding var fieldValue: String
    var placeholderText: String
    
    enum Style {
        case password
        case `default`
        case search
        
        var icon: Image? {
            switch self {
            case .password:
                return .visibilityOff
            case .search:
                return .search
            default:
                return nil
            }
        }
    }
    
    init(
        style: Binding<Style> = .constant(.default),
        title: String? = nil,
        placeholderText: String = "",
        fieldValue: Binding<String> = .constant("")
    ) {
        self._style = style
        self.title = title
        self.placeholderText = placeholderText
        self._fieldValue = fieldValue
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading) {
            if let title = title {
                Text(title)
                    .font(.regular(.size14))
            }
            textInputView(configuration)
        }
    }
    
    private func textInputView(_ configuration: TextField<_Label>) -> some View {
        HStack {
            if style == .password && showPassword {
                TextField(placeholderText, text: self.$fieldValue)
            } else {
                configuration
            }
            
            if style.icon != nil {
                style.icon.onTapGesture {
                    if style == .password { showPassword.toggle() }
                }
            }
        }
        .frame(height: UIConstants.Defaults.spacerHeight)
        .padding()
        .overlay(alignment: .trailing) {
            RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius, style: .continuous)
                .stroke(Color(UIColor.systemGray4), lineWidth: UIConstants.MarketTexfield.lineWidth)
        }
        .background(Color.white)
        .cornerRadius(UIConstants.Defaults.cornerRadius)
    }
}
