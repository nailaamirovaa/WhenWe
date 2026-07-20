//
//  AppTextField.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

struct AppTextField: View {

    let placeholder: String
    @Binding var text: String

    @FocusState private var isFocused: Bool

    var body: some View {

        TextField("", text: $text)
            .focused($isFocused)
            .font(AppFont.body)
            .foregroundStyle(AppColors.Text.primary)
            .padding(.horizontal, Spacing.md)
            .frame(height: 56)
            .background(AppColors.Background.card)
            .overlay {
                RoundedRectangle(cornerRadius: Radius.large)
                    .stroke(borderColor, lineWidth: 1)
            }
            .clipShape(
                RoundedRectangle(cornerRadius: Radius.large)
            )
            .overlay(alignment: .leading) {

                if text.isEmpty {

                    Text(placeholder)
                        .font(AppFont.body)
                        .foregroundStyle(AppColors.Text.tertiary)
                        .padding(.horizontal, Spacing.md)
                        .allowsHitTesting(false)
                }
            }
    }

    private var borderColor: Color {

        isFocused
        ? AppColors.Text.primary
        : AppColors.Border.default
    }
}
