//
//  SecondaryButtonStyle.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

private struct SecondaryButtonStyle: ButtonStyle {

    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .background(
                RoundedRectangle(cornerRadius: Radius.large)
                    .fill(background(configuration))
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .opacity(isEnabled ? 1 : 0.5)
            .animation(.easeOut(duration: 0.15),
                       value: configuration.isPressed)
    }

    private func background(_ configuration: Configuration) -> Color {

        guard isEnabled else {
            return AppColors.Brand.soft
        }

        if configuration.isPressed {
            return AppColors.Brand.soft.opacity(0.75)
        }

        return AppColors.Brand.soft
    }
}