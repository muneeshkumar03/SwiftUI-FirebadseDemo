//
//  CapsuleButtonStyle.swift
//  FirebaseAuth
//
//  Created by Encora on 06/12/24.
//
import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    var bgColor: Color = Color.teal
    var textColor: Color = Color.white
    var hasBorder: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .overlay {
                hasBorder ?
                Capsule()
                    .stroke(.gray, lineWidth: 1) :
                nil
            }
    }
}
