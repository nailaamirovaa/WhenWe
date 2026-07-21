//
//  EmptyState.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct EmptyState: View {

    let emoji: String
    let title: String
    let description: String
    let buttonTitle: String?
    let action: (() -> Void)?

    init(
        emoji: String,
        title: String,
        description: String,
        buttonTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.emoji = emoji
        self.title = title
        self.description = description
        self.buttonTitle = buttonTitle
        self.action = action
    }

    var body: some View {

        VStack(spacing: Spacing.lg) {

            Text(emoji)
                .font(.system(size: 56))

            VStack(spacing: Spacing.xs) {

                Text(title)
                    .font(AppFont.title2)
                    .foregroundStyle(AppColors.Text.primary)
                    .multilineTextAlignment(.center)

                Text(description)
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.secondary)
                    .multilineTextAlignment(.center)
            }

            if let buttonTitle,
               let action {

                PrimaryButton(
                    title: buttonTitle,
                    action: action
                )
            }
        }
        .padding(.horizontal, Spacing.xl)
    }
}
