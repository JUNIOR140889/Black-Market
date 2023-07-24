//
//  MarketTexfield.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/12/23.
//

import SwiftUI

struct MarketTexfield: TextFieldStyle {
    @Binding var style: Style
    private let title: String?
        
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
        title: String? = nil
    ) {
        self._style = style
        self.title = title
    }
    
    func _body(configuration: TextField<_Label>) -> some View {
        
        VStack(alignment: .leading) {
            if let title = title {
                Text(title).font(.custom("Open Sans", size: UIConstants.MarketTexfield.size))
            }
            HStack {
                configuration
                if style.icon != nil {
                    style.icon
                        .foregroundColor(Color(UIColor.systemGray4))
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: UIConstants.MarketTexfield.lineWidth)
            }
            .background(Color.white)
            .cornerRadius(UIConstants.Defaults.cornerRadius)
        }
    }
}
