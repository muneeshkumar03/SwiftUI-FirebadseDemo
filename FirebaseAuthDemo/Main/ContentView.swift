//
//  ContentView.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 13/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    var body: some View {
        Group {
            if authModel.userSession == nil {
                LoginView(loginViewModel: LoginViewModel())
            } else {
                ProfileView()
            }
        }
        .environmentObject(authModel)
    }
}

#Preview {
    ContentView()
}
