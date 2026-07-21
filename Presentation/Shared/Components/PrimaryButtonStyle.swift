//
//  PrimaryButtonStyle.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

    let isEnabled: Bool
    let isLoading: Bool

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .background(
                background(configuration: configuration)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.15),
                       value: configuration.isPressed)
    }

    @ViewBuilder
    private func background(configuration: Configuration) -> some View {

        RoundedRectangle(cornerRadius: Radius.large)
            .fill(color(configuration: configuration))
    }

    private func color(configuration: Configuration) -> Color {

        guard isEnabled else {
            return AppColors.Brand.soft
        }

        if configuration.isPressed {
            return AppColors.Brand.primaryPressed
        }

        return AppColors.Brand.primary
    }
}