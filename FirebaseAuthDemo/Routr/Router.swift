//
//  Router.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 13/01/25.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    enum AuthFlow: Hashable, Codable {
        case login
        case creteAccount
        case profile
        case forgotPassword
        case emailSent
    }
    
    func navigateTo(destination: AuthFlow) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}
