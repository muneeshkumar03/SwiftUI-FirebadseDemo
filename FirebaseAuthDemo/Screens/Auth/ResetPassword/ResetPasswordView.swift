//
//  ResetPasswordView.swift
//  FirebaseAuthDemo
//
//  Created by Muneesh Kumar on 04/01/25.
//

import Foundation
import SwiftUI

struct ResetPasswordView: View {

    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var router: Router
    @StateObject private var resetPasswordViewModel: ResetPasswordViewModel = ResetPasswordViewModel()
    @State private var showAlert: Bool = false
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Reset Password")
                .font(.title)
                .fontWeight(.bold)
            Text("Enter the email associated with your account and we'll send an email with instructions on how to reset your password.")
                .font(.body)
                .fontWeight(.light)
                .padding(.bottom, 30)
            InputView(text: $resetPasswordViewModel.email, placeholder: "Enter your email")
                .padding(.bottom, 20)
            Button {
                if !resetPasswordViewModel.isValidEmail() {
                    showAlert = true
                }
                if !showAlert {
                    Task {
                        await authViewModel.resetPassword(email: resetPasswordViewModel.email)
                    }
                    if authViewModel.isSuccess {
                        router.navigateTo(destination: .emailSent)
                    }
                }
            } label: {
                Text("Send Instructions")
            }
            .buttonStyle(CapsuleButtonStyle())
            .alert(resetPasswordViewModel.emailErrorMessage ?? "", isPresented: $showAlert, actions: { })
            .alert(isPresented: $authViewModel.isError, error: authViewModel.errorMessage, actions: { })
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
    }
}
