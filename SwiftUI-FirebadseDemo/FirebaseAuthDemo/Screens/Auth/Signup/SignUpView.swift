//
//  SignUp.swift
//  FirebaseAuth
//
//  Created by Encora on 07/12/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailOrPhoneNumber: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var fullName: String = ""
    let authViewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Please complete all information to create an account.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 16)
            InputView(text: $emailOrPhoneNumber, placeholder: "Email or Phone Number")
            InputView(text: $password, placeholder: "Password", isSecureField: true)
            
            // confirm password with validation logic
            ZStack(alignment: .trailing) {
                InputView(text: $confirmPassword, placeholder: "Confirm Password", isSecureField: true)
                Spacer()
                
                if password != confirmPassword && !confirmPassword.isEmpty {
                    Image(systemName: "xmark.app.fill")
                        .foregroundStyle(.red)
                }  else if password == confirmPassword && !confirmPassword.isEmpty {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundStyle(.green)
                }
            }
            InputView(text: $fullName, placeholder: "Full Name")
            
            Button {
                Task {
                    await authViewModel.createUser(email: emailOrPhoneNumber, password: password, fullName: fullName)
                }
            } label: {
                Text("Create Account")
            }
            .buttonStyle(CapsuleButtonStyle())

            Spacer()
        }
        .navigationTitle("set up your account")
        .toolbarRole(.editor)
        .padding()
    }

}

#Preview {
    SignUpView()
}
