//
//  LinkNavigation.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/12/23.
//

import SwiftUI

enum InternalLinkRoutes: String {
    case dataPolicy
    case cookiesPolicy
    case forgotPassword
}

extension View {
    func handleTappableLinks() -> some View {
        modifier(LinkNavigation())
    }
}

struct LinkNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.openURL, OpenURLAction { url in
                guard url.scheme == nil else {
                    return .systemAction(url)
                }
                guard let route = InternalLinkRoutes(rawValue: url.absoluteString) else { return .discarded }
                switch route {
                case .dataPolicy:
                    print("Go to  Data Policy screen")
                case .cookiesPolicy:
                    print("Go to  Cookies screen")
                case .forgotPassword:
                    print("Go to Password screen")
                }
                return .handled
           })
    }
}
