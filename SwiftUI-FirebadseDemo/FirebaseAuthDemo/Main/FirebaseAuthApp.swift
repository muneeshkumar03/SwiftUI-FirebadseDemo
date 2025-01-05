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
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView(authViewModel: authViewModel, loginViewModel: LoginViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
