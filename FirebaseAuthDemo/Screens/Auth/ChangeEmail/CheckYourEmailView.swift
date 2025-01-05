//
//  CheckYourEmailView.swift
//  FirebaseAuthYoutube
//
//  Created by Encora on 05/01/25.
//

import SwiftUI

struct CheckYourEmailView: View {
    var body: some View {
      //  NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                Image(systemName: "envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.teal)
                
                
                Text("Check your email")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("We have sent a password instructions to your email.")
                    .padding(.bottom, 30)
                Button {
                    
                } label: {
                    Text("Skip, I'll confirm later")
                }
                .buttonStyle(CapsuleButtonStyle())
                Spacer()
                
                
                Text(getAttributedText())
                    .onTapGesture {
                        print("Gasture called")
                    }
            }
      //  }
        .padding()
        .toolbarRole(.editor)
    }
    
 
    private func getAttributedText() -> AttributedString {
        var attributedText = AttributedString("Did not receive the email? Check your spam filter, or try another email address.")
        if let linkRange = attributedText.range(of: "try another email address") {
            attributedText[linkRange].foregroundColor = .teal
        }
        return attributedText
    }
   
}

#Preview {
    CheckYourEmailView()
}
