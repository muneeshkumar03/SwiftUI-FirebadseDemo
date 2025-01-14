//
//  ContentView.swift
//  FirebaseAuth
//
//  Created by Muneesh Kumar on 07/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isNavigationg: Bool  = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router : Router
    @StateObject var loginViewModel: LoginViewModel
    @State private var isShowingAlert: Bool = false
    @State private var isLoginButtonTapped: Bool = false
    
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
            InputView(text: $loginViewModel.email, placeholder: "EmailId")
            InputView(text: $loginViewModel.password, placeholder: "Password", isSecureField: true)
        }
    }
    
    private var loginButton: some View {
        Button {
            isLoginButtonTapped = true
            loginViewModel.checkValidation()
            isShowingAlert = isLoginButtonTapped && (loginViewModel.email.isEmpty || loginViewModel.password.isEmpty)
            
            if !isShowingAlert {
                Task {
                    await authViewModel.loginUser(email: loginViewModel.email, password: loginViewModel.password)
                    if !authViewModel.isError {
                        debugPrint("User successfully logged in")
                    }
                }
            }
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButtonStyle())
        .alert(getErrorMessage(), isPresented: $isShowingAlert, actions: { })
        .alert(isPresented: $authViewModel.isError, error: authViewModel.errorMessage, actions: { })
    }
    
    private func getErrorMessage() -> String {
        if !(loginViewModel.emailError?.isEmpty ?? false) {
            return loginViewModel.emailError ?? ""
        }
        if !(loginViewModel.passwordError?.isEmpty ?? false) {
            return loginViewModel.passwordError ?? ""
        }
        return ""
    }
    
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button(action: {
                router.navigateTo(destination: .forgotPassword)
                debugPrint("Forgot Password button tapped")
            }) {
                Text("Forgot Password?")
                    .foregroundColor(.gray)
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
            
            Button {
                router.navigateTo(destination: .creteAccount)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.black)
                    Text("Sign Up")
                        .foregroundStyle(.teal)
                }
                .fontWeight(.medium)
            }
        }
    }
    var body: some View {
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

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
