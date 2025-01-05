//
//  ResetPasswordView.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 04/01/25.
//

import Foundation
import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Reset Password")
                .font(.title)
                .fontWeight(.bold)
            Text("Enter the email associated with your account and we'll send an email with instructions on how to reset your password.")
                .font(.body)
                .fontWeight(.light)
                .padding(.bottom, 30)
            InputView(text: $email, placeholder: "Enter your email")
                .padding(.bottom, 20)
            Button {
                
            } label: {
                Text("Send Instructions")
            }
            .buttonStyle(CapsuleButtonStyle())
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
    }
}
