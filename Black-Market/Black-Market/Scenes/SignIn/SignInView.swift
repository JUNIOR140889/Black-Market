//
//  SignInView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/12/23.
//

import SwiftUI

struct SignInView: View {
    enum Destination: Hashable {
        case home, signUp
    }
    @State private var path: [Destination] = []
    @State private var style: MarketButton.Style = .disabled
    
    @ObservedObject var viewModel: SignInViewModel = SignInViewModel()
    private var tappableText: AttributedString {
        var text = AttributedString(localized: "I forgot my password", comment: "forgot password button title")
        text.link = URL(string: InternalLinkRoutes.forgotPassword.rawValue)
        text.foregroundColor = Color.AppColors.blue
        text.font = .bold(.size16)
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
                .navigationDestination(for: Destination.self) {
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
            TextField("Type your email", text: $viewModel.email)
                .textFieldStyle(
                    MarketTextFieldStyle(
                        style: .constant(.default),
                        title: String(localized: "Email", comment: "Email title")
                    )
                )
                .onChange(of: viewModel.email) { newValue in
                    style = viewModel.isFormValid ? .filled : .disabled
                }

            SecureField("Type your password", text: self.$viewModel.password)
                .textFieldStyle(
                    MarketTextFieldStyle(
                        style: .constant(.password),
                        title: String(localized: "Password", comment: "Password title"),
                        placeholderText: "Type your password",
                        fieldValue: self.$viewModel.password
                    )
                )
                .onChange(of: viewModel.password) { newValue in
                    style = viewModel.isFormValid ? .filled : .disabled
                }
            
            MarketButton(style: $style, action: {
                path.append(.home)
                viewModel.signIn()
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
            Text("Don’t have an account?")
                .font(.regular(.size16))
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
