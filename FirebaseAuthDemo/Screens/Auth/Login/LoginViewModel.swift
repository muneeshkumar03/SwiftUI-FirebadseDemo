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
        emailError = email.isEmpty ? "Please enter email" : (isValidEmail(email) ? "" : "Please enter valid email")
        passwordError = password.isEmpty ? "Please enter password" : ""
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
