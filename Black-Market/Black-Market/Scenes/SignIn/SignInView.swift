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
                    VStack(spacing: 15) {
                        Image("BlackmarketLogo")

                        TextField("Type your email", text: $email)
                            .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Email"))
                            .onChange(of: email) { newValue in
                                isEmailValid = isValidEmail(newValue)
                                print("isEmailValid: ", isEmailValid)
                                style = (isEmailValid && isPasswordValid) ? .filled : .disabled
                                print("Style-Button: ", style)
                            }

                        TextField("Type your password", text: $password)
                            .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Password"))
                            .onChange(of: password) { newValue in
                                isPasswordValid = isValidPassword(newValue)
                                print("isPasswordValid: ", isPasswordValid)
                                style = (isEmailValid && isPasswordValid) ? .filled : .disabled
                                print("Style-Button: ", style)
                            }

                        MarketButton(style: $style, action: {
                            print("Button tapped")
                            path.append(.home)
                        }, title: "Log In")
                        
                        Text(tappableText)
                            .handleTappableLinks()
                    }
                    .padding(10)
                    .frame(width: 328, height: 366)
                    .background(.white,
                                in: RoundedRectangle(cornerRadius: 8,
                                                     style: .continuous))

                    Spacer()
                        .frame(height: 20)

                    VStack(spacing: 15) {
                        Text("Don’t have an account?").font(.custom("Open Sans", size: 14))
                        MarketButton(style: .constant(.plain), action: {
                            print("Button tapped")
                            path.append(.signUp)
                        }, title: "Sign Up")
                    }
                    .padding(10)
                    .frame(width: 328, height: 121)
                    .background(.white,
                                in: RoundedRectangle(cornerRadius: 8,
                                                     style: .continuous))

                }
            }
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
    
    func isValidEmail(_ email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.caseInsensitive])
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.utf16.count)) != nil
    }

    func isValidPassword(_ password: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$", options: [])
        return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.utf16.count)) != nil
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
