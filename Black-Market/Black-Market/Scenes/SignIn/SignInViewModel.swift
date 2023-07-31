//
//  SignInViewModel.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/30/23.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var password = ""
    @Published var email = ""
    
    var isFormValid: Bool {
        email.isValidEmail && password.isValidPassword
    }
}
