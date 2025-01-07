//
//  Utility.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 07/01/25.
//

import Foundation

final class Utility {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
