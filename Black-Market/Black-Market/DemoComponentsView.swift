//
//  ContentView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI
import UIKit

struct DemoComponentsView: View {
    @State var input = ""
    var body: some View {
        VStack(spacing: 15) {
            Text("My components")
            MarketButton(style: .constant(.filled), action: {
                print("Button tapped")
            }, title: "My button")

            MarketButton(style: .constant(.disabled), action: {
                print("Button tapped")
            }, title: "My button")
            
            MarketButton(style: .constant(.plain), action: {
                print("Button tapped")
            }, title: "My button")
            
            TextField("Type your password", text: $input)
                .textFieldStyle(MarketTexfield(style: .constant(.password), title: "Password"))
            
            TextField("Insert email", text: $input)
                .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Email"))
            
            TextField("Searching ...", text: $input)
                .textFieldStyle(MarketTexfield(style: .constant(.search), title: "Sarch"))
            
            Text(tappableText)
                 .environment(\.openURL, OpenURLAction { url in
                       print(url) // do what you like
                       return .handled  // compiler won't launch Safari
                })
        }
        .padding(10)
    }
    
    var tappableText: AttributedString {
        var text = AttributedString("I am tappable!")
        text.link = URL(string: "https://stackoverflow.com")
        text.foregroundColor = .green
        return text
    }
}

struct DemoComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        DemoComponentsView()
    }
}
