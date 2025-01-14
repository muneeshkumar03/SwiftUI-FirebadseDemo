//
//  InputView.swift
//  FirebaseAuth
//
//  Created by Muneesh Kumar on 06/12/24.
//
import SwiftUI

struct InputView: View {
    @Binding var text: String
    var placeholder: String
    var isSecureField: Bool = false
    var body: some View {
        VStack(spacing: 16) {
            if isSecureField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            Divider()
        }
    }
}
