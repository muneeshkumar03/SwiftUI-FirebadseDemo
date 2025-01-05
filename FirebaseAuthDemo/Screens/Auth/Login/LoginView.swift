//
//  ContentView.swift
//  FirebaseAuth
//
//  Created by Encora on 07/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var emailOrPhone: String = ""
    @State private var password: String = ""
    @State private var isNavigationg: Bool  = false
    @State private var path: [String] = []
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject var loginViewModel: LoginViewModel
    
    private var imageView: some View {
        Image("login_image")
            .resizable()
            .scaledToFit()
    }
    
    private var title: some View {
        VStack {
            Text("Let's Connect With US!")
                .font(.system(size: 30))
                .bold()
            Spacer()
                .frame(height: 32)
        }
    }
    
    private var textFields: some View {
        VStack {
            InputView(text: $emailOrPhone, placeholder: "Email or Phone Number")
            InputView(text: $password, placeholder: "Password", isSecureField: true)
        }
    }
    
    private var loginButton: some View {
        Button {
            // Perform action here
            loginViewModel.checkValidation()
            if loginViewModel.email.isEmpty && loginViewModel.password.isEmpty {
                Task {
                    await authViewModel.loginUser(email: emailOrPhone, password: password)
                }
            }
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButtonStyle())
    }
    
    private var forgotPasswordButton: some View {
        NavigationStack(path: $path) {
            HStack {
                Spacer()
                Button(action: {
                    debugPrint("Forgot Password button tapped")
                    path.append("ForgotPassword")
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.gray)
                }
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "ForgotPassword" {
                    ResetPasswordView()
                }
            }
        }
    }
    
    private var bottomButtons: some View {
            VStack(spacing: 16) {
                // LabelledDiveder
                LabelledDivider(label: "Or")
                
                Button {
                    // Perform action here
                } label: {
                    Label("Sign up with Apple", systemImage: "apple.logo")
                }
                .buttonStyle(CapsuleButtonStyle(bgColor: .black))
                
                Button {
                    // Perform action here
                } label: {
                    HStack {
                        Image("google")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("Sign up with Google")
                    }
                }
                .buttonStyle(CapsuleButtonStyle(bgColor: .white, textColor: .black, hasBorder: true))
                
                
                HStack {
                    Text("Don't have an account?")
                        .font(.title2)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.title2)
                            .foregroundStyle(.teal)
                    }
                }
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // ImageView
                    imageView
                    // Title
                    title
                    // TextFields
                    textFields
                    // Forgot Passport Button
                    forgotPasswordButton
                    // Login Button
                    loginButton
                    //Spacer
                    Spacer()
                    // Bottom Buttons
                    bottomButtons
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel(), loginViewModel: LoginViewModel())
}
