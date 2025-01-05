//
//  ProfileView.swift
//  FirebaseAuthDemo
//
//  Created by Encora on 20/12/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("MK")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.lightGray))
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Muneeesh Kumar")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("muneeshlkumar03@gmail.com")
                            .font(.footnote)
                    }
                }
            }
            
            Section("Account") {
                Button {
                    
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
