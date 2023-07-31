//
//  SignUpView.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/10/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    @State private var style: MarketButton.Style = .disabled
    
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
            
            TextField("Type your full name", text: $viewModel.fullName)
                .textFieldStyle(
                    MarketTextFieldStyle(
                        style: .constant(.default),
                        title: String(localized: "Full Name", comment: "Full Name title")
                    )
                )
                .onChange(of: viewModel.fullName) { newValue in
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
                .onChange(of: viewModel.email) { newValue in
                    style = viewModel.isFormValid ? .filled : .disabled
                }
            MarketButton(style: $style, action: {
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
        attributedString.foregroundColor = Color.AppColors.blue
        attributedString.font = .regular(.size14)
        attributedString.link = URL(string: link.rawValue)
        return attributedString
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

private extension UIConstants {
    enum SignUpView {
        static let spacing: CGFloat = 20
    }
}
