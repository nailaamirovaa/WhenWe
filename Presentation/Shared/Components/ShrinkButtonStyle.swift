//
//  PrimaryButtonStyle.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

struct ShrinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
