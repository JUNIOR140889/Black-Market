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
        var text = AttributedString("I forgot my password")
        text.link = URL(string: InternalLinkRoutes.forgotPassword.rawValue)
        text.foregroundColor = Color("BlueStyle")
        text.font = .custom("Open Sans", size: 16)
        return text
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack() {
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    mainCardView
                    Spacer()
                        .frame(height: 20)
                    signUpCardView

                }
                .padding(24)
                .navigationTitle("")
                .navigationDestination(for: Dest.self) {
                    switch $0 {
                    case .home:
                        Text("Home Destination Here")
                    case .signUp:
                        SignUpView()
                    }
                }
                
            }
        }
    }
    
    private var mainCardView: some View {
        VStack(spacing: 15) {
            Image("BlackmarketLogo")
            TextField("Type your email", text: $email)
                .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Email"))
                .onChange(of: email) { newValue in
                    isEmailValid = newValue.isValidEmail
                    style = (isEmailValid && isPasswordValid) ? .filled : .disabled
                }

            SecureField("Type your password", text: self.$password)
                .textFieldStyle(
                    MarketTexfield(
                        style: .constant(.password),
                        title: "Password",
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
            }, title: "Log In")
            
            Text(tappableText)
                .handleTappableLinks()
        }
        .padding(28)
        .background(
            .white,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
    
    private var signUpCardView: some View {
        VStack(spacing: 15) {
            Text("Don’t have an account?").font(.custom("Open Sans", size: 14))
            MarketButton(style: .constant(.plain), action: {
                path.append(.signUp)
            }, title: "Sign Up")
        }
        .padding(28)
        .background(.white,
                    in: RoundedRectangle(cornerRadius: 8,
                                         style: .continuous))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


//StringExtension
extension String {
    var isValidEmail: Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) != nil
    }
    
    var isValidPassword: Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$", options: [])
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) != nil
    }
}
