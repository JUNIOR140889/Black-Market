//
//  SignUpView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        
        VStack(spacing: 15) {
            Text("My Buttons")
            MarketButton(style: .constant(.filled), action: {
                print("Button tapped")
            }, title: "My button")

            MarketButton(style: .constant(.disabled), action: {
                print("Button tapped")
            }, title: "My button")
            
            MarketButton(style: .constant(.plain), action: {
                print("Button tapped")
            }, title: "My button")
        }
        .padding(10)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
