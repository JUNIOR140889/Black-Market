//
//  SignUpViewModel.swift
//  Black-Market
//
//  Created by Junior Sancho on 7/30/23.
//
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    var isFormValid: Bool {
        email.isValidEmail && !fullName.isEmpty && password.isValidPassword
    }
}
