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
    
    var attributedString: AttributedString {
        var string = AttributedString("By signing up, you accept the ")
        string.append(setCustomStyle("Data Policy", link: .dataPolicy))
        string.append(AttributedString(" and "))
        string.append(setCustomStyle("Cookies Policy.", link: .cookiesPolicy))
        return string
    }
    
    var body: some View {
        ZStack() {
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Image("BlackmarketLogo")
                
                TextField("Type your email", text: $email)
                    .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Email"))
                
                TextField("Type your full name", text: $fullName)
                    .textFieldStyle(MarketTexfield(style: .constant(.default), title: "Full Name"))
                
                SecureField("Type your password", text: self.$password)
                    .textFieldStyle(
                        MarketTexfield(
                            style: .constant(.password),
                            title: "Password",
                            placeholderText: "Type your password",
                            fieldValue: self.$password
                        )
                    )
                
                MarketButton(style: .constant(.disabled), action: {
                    print("Button tapped")
                }, title: "Sign Up")
                
                Text(attributedString)
                    .handleTappableLinks()

            }
            .padding(10)
            .frame(width: 328, height: 496)
            .background(.white,
                        in: RoundedRectangle(cornerRadius: 8,
                                             style: .continuous))
        }
    }
    
    func setCustomStyle(_ string: String, link: InternalLinkRoutes) -> AttributedString {
        var attributedString = AttributedString(string)
        attributedString.foregroundColor = Color("BlueStyle")
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
