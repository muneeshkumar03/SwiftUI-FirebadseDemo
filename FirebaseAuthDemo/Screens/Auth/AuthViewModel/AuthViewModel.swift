//
//  AuthViewModel.swift
//  FirebaseAuth
//
//  Created by Encora on 11/12/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    
    let auth: Auth = Auth.auth()
    let firebaseStore: Firestore = Firestore.firestore()
    @Published var userSession: FirebaseAuth.User? // firebase's user
    @Published var currentUser: User? // app's current user
    @Published var isError: Bool = false
    @Published var errorMessage: NetworkError?
    
    func createUser(email: String, password: String, fullName: String) async {
        do {
            let user = try await auth.createUser(withEmail: email, password: password)
            let userData = User(uid: user.user.uid, email: email, fullName: fullName)
            await saveUser(userData)
        } catch {
            print("Error creating user: \(error)")
        }
    }
    
    private func saveUser(_ user: User) async {
        do {
            try firebaseStore.collection("users").document(user.uid).setData(from: user)
        } catch {
            print("Error saving user: \(error)")
        }
    }
    
    func loginUser(email: String, password: String) async {
        do {
            let user = try await auth.signIn(withEmail: email, password: password)
            userSession = user.user
            await fetchuser(uId: user.user.uid)
            print("User logged in: \(user.user.uid)")
        } catch {
            isError = true
            errorMessage = NetworkError.apiError(error.localizedDescription)
            print("Error logging in user: \(error)")
        }
    }
    
    private func fetchuser(uId: String) async {
        do {
            let document = try await firebaseStore.collection("users").document(uId).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            debugPrint("error \(error)")
        }
        
    }
}


enum NetworkError: LocalizedError {
    case apiError(String)
    
    var errorDescription: String? {
        switch self {
        case .apiError(let apiError):
            return apiError
        }
    }
}
