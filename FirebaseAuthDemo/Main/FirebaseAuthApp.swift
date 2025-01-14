//
//  FirebaseAuthApp.swift
//  FirebaseAuth
//
//  Created by Encora on 07/12/24.
//

import SwiftUI
import UIKit
import FirebaseCore

@main
struct FirebaseAuthApp: App {
    // register app delegte for firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    @StateObject private var authViewModel: AuthViewModel = AuthViewModel()
    @ObservedObject private var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .navigationDestination(for: Router.AuthFlow.self) { destination in
                        switch destination {
                        case .login: LoginView(loginViewModel: LoginViewModel())
                        case .creteAccount: SignUpView()
                        case .profile: ProfileView()
                        case .forgotPassword: ResetPasswordView()
                        case .emailSent: CheckYourEmailView()
                        }
                    }
            }
            .environmentObject(authViewModel)
            .environmentObject(router)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
