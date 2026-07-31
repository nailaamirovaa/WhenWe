//
//  SelectionCard.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct SelectionCard: View {

    let emoji: String
    let title: String
    var isSelected: Bool = false
    var isDashed: Bool = false
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            VStack(spacing: Spacing.xxs) {

                Text(emoji)
                    .font(.system(size: isDashed ? 22 : 26))

                Text(title)
                    .font(AppFont.label)
                    .foregroundStyle(textColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 76)
            .background(background)
            .overlay(border)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
        }
        .buttonStyle(.plain)
    }
}

private extension SelectionCard {

    var background: Color {
        isSelected ? AppColors.Brand.soft : AppColors.Background.card
    }

    var textColor: Color {
        isSelected ? AppColors.Brand.primary : AppColors.Text.secondary
    }

    @ViewBuilder
    var border: some View {

        if isDashed {
            RoundedRectangle(cornerRadius: Radius.medium)
                .strokeBorder(AppColors.Text.tertiary, style: StrokeStyle(lineWidth: 1.5, dash: [5]))
        } else {
            RoundedRectangle(cornerRadius: Radius.medium)
                .stroke(isSelected ? AppColors.Brand.primary : AppColors.Border.default, lineWidth: 1.5)
        }
    }
}
