//
//  SignInView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/12/23.
//

import SwiftUI

struct SignInView: View {
    enum Dest: Hashable {
        case home, signUp
    }
    @State private var password = ""
    @State private var email = ""
    @State private var path: [Dest] = []
    @State private var isEmailValid: Bool = false
    @State private var isPasswordValid: Bool = false
    @State private var style: MarketButton.Style = .disabled
    
    private var tappableText: AttributedString {
        var text = AttributedString(localized: "I forgot my password", comment: "forgot password button title")
        text.link = URL(string: InternalLinkRoutes.forgotPassword.rawValue)
        text.foregroundColor = .blueStyle
        text.font = .custom("Open Sans", size: 16)
        return text
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack() {
                Image.backgroundImage
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    mainCardView
                    Spacer()
                        .frame(height: UIConstants.Defaults.spacerHeight)
                    signUpCardView
                }
                .padding(UIConstants.Defaults.padding)
                .navigationTitle("")
                .navigationDestination(for: Dest.self) {
                    switch $0 {
                    case .home:
                        Text("Home Destination Here", comment: "Home screen title")
                    case .signUp:
                        SignUpView()
                    }
                }
            }
        }
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
                .onChange(of: email) { newValue in
                    isEmailValid = newValue.isValidEmail
                    style = (isEmailValid && isPasswordValid) ? .filled : .disabled
                }

            SecureField("Type your password", text: self.$password)
                .textFieldStyle(
                    MarketTexfield(
                        style: .constant(.password),
                        title: String(localized: "Password", comment: "Password title"),
                        placeholderText: "Type your password",
                        fieldValue: self.$password
                    )
                )
                .onChange(of: password) { newValue in
                    isPasswordValid = newValue.isValidPassword
                    style = (isEmailValid && isPasswordValid) ? .filled : .disabled
                }
            
            MarketButton(style: $style, action: {
                path.append(.home)
            }, title: String(localized: "Log In", comment: "Log In button title"))
            
            Text(tappableText)
                .handleTappableLinks()
        }
        .padding(UIConstants.Defaults.padding)
        .background(
            .white,
            in: RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius, style: .continuous)
        )
    }
    
    private var signUpCardView: some View {
        VStack(spacing: UIConstants.Defaults.spacing) {
            Text("Don’t have an account?").font(.custom("Open Sans", size: 14))
            MarketButton(style: .constant(.plain), action: {
                path.append(.signUp)
            }, title: String(localized: "Sign Up", comment: "Sign Up button title"))
        }
        .padding(UIConstants.Defaults.padding)
        .background(.white,
                    in: RoundedRectangle(cornerRadius: UIConstants.Defaults.cornerRadius,
                                         style: .continuous))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
