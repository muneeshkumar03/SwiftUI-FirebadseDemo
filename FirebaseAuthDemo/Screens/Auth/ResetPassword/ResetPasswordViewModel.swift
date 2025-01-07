//
//  ResetPasswordViewModel.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 06/01/25.
//

import Foundation

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var emailErrorMessage: String?
    
    func isValidEmail() -> Bool {
        if email.isEmpty {
            emailErrorMessage = "Please enter your email address."
            return false
        }
        if !Utility.isValidEmail(email) {
            emailErrorMessage = "Please enter a valid email address."
            return false
        }
        return true
    }
}
