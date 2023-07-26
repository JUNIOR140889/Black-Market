//
//  SignUpView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI

struct SignUpView: View {
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    
    private var attributedString: AttributedString {
        var string = AttributedString(localized: "By signing up, you accept the", comment: "")
        string.append(AttributedString(" "))
        string.append(setCustomStyle(
            String(localized: "Data Policy", comment: "Data policy link title"), link: .dataPolicy)
        )
        string.append(AttributedString(" "))
        string.append(AttributedString(String(localized: "and")))
        string.append(AttributedString(" "))
        string.append(setCustomStyle(
            String(localized: "Cookies Policy."), link: .cookiesPolicy)
        )
        return string
    }
    
    private var mainCardView: some View {
        VStack(spacing: UIConstants.Defaults.spacing) {
            Image.blackmarketLogo
            
            TextField("Type your email", text: $email)
                .textFieldStyle(
                    MarketTexfield(
                        style: .constant(.default),
                        title: String(localized: "Email", comment: "Email title")
                    )
                )
            
            TextField("Type your full name", text: $fullName)
                .textFieldStyle(
                    MarketTexfield(
                        style: .constant(.default),
                        title: String(localized: "Full Name", comment: "Full Name title")
                    )
                )
            
            SecureField("Type your password", text: self.$password)
                .textFieldStyle(
                    MarketTexfield(
                        style: .constant(.password),
                        title: String(localized: "Password", comment: "Password title"),
                        placeholderText: "Type your password",
                        fieldValue: self.$password
                    )
                )
            MarketButton(style: .constant(.disabled), action: {
                print("Button tapped")
            }, title: String(localized: "Sign Up", comment: "Sign Up button title"))
            
            Text(attributedString)
                .handleTappableLinks()
        }
        .padding(UIConstants.Defaults.padding)
        .background(
            .white,
            in: RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius, style: .continuous)
        )
    }
    
    var body: some View {
        ZStack() {
            Image.backgroundImage
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: UIConstants.SignUpView.spacing) {
                mainCardView
            }
            .padding(UIConstants.Defaults.padding)
            .navigationTitle("")
        }
    }
    
    func setCustomStyle(_ string: String, link: InternalLinkRoutes) -> AttributedString {
        var attributedString = AttributedString(string)
        attributedString.foregroundColor = .blueStyle
        attributedString.font = .custom("Open Sans", size: 16)
        attributedString.link = URL(string: link.rawValue)
        return attributedString
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
