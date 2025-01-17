//
//  CheckYourEmailView.swift
//  FirebaseAuthYoutube
//
//  Created by Muneesh Kumar on 05/01/25.
//

import SwiftUI

struct CheckYourEmailView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
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
                    router.navigateBack()
                } label: {
                    Text("Skip, I'll confirm later")
                }
                .buttonStyle(CapsuleButtonStyle())
                Spacer()
                
                
                Text(getAttributedText())
                    .onTapGesture {
                        print("Gasture called")
                        router.navigateToRoot()
                    }
            }
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
