//
//  ProfileView.swift
//  FirebaseAuthDemo
//
//  Created by Muneesh Kumar on 20/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        List {
            Section {
                HStack {
                    Text(Utility.getInitials(from: authViewModel.currentUser?.fullName ?? ""))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.lightGray))
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(authViewModel.currentUser?.fullName ?? "")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(authViewModel.currentUser?.email ?? "")
                            .font(.footnote)
                    }
                }
            }
            
            Section("Account") {
                Button {
                    Task {
                        await authViewModel.signOutUser()
                    }
                } label: {
                    Label {
                        Text("Sign Out")
                            .font(.footnote)
                            .foregroundStyle(.black)
                    } icon: {
                        Image(systemName: "arrow.left.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
                
                Button {
                    Task {
                        await authViewModel.deleteUser()
                    }
                } label: {
                    Label {
                        Text("Delete Account")
                            .font(.footnote)
                            .foregroundStyle(.black)
                    } icon: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }

            }
        }
    }
}

#Preview {
    ProfileView()
}
