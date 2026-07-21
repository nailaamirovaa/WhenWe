//
//  PrimaryButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    var isLoading: Bool = false
    var isEnabled: Bool = true
    let action: () -> Void

    @GestureState private var isPressed = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.sm) {

                if isLoading {
                    ProgressView()
                        .tint(textColor)
                }

                Text(title)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(.white )
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(cornerRadius: Radius.large)
            )
        }
        .disabled(!isEnabled || isLoading)
        .buttonStyle(
            PrimaryButtonStyle(
                isEnabled: isEnabled,
                isLoading: isLoading
            )
        )
    }

    private var backgroundColor: Color {
        if !isEnabled {
            return AppColors.Brand.soft
        }

        return AppColors.Brand.primary
    }
    
    private var textColor: Color {
        isEnabled
            ? AppColors.Text.primary
            : AppColors.Text.primary.opacity(0.65)
    }
}
