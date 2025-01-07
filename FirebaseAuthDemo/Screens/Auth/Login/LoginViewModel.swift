//
//  LoginViewModel.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 04/01/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var emailError: String?
    @Published var passwordError: String?
    
    func checkValidation() {
        emailError = email.isEmpty ? "Please enter email" : (Utility.isValidEmail(email) ? "" : "Please enter valid email")
        passwordError = password.isEmpty ? "Please enter password" : ""
    }
}
