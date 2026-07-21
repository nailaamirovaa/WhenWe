//
//  Chip.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct Chip: View {

    let title: String
    let icon: String?
    let style: ChipStyle
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: Spacing.xs) {

                Text(title)
                    .font(AppFont.bodyStrong)

                if let icon {
                    Text(icon)
                }
            }
            .foregroundStyle(textColor)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(background)
            .overlay(border)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

private extension Chip {

    var background: Color {

        switch style {

        case .selected:
            return AppColors.Semantic.going

        case .unselected:
            return AppColors.Background.card
        }
    }

    var textColor: Color {

        switch style {

        case .selected:
            return .white

        case .unselected:
            return AppColors.Text.primary
        }
    }

    @ViewBuilder
    var border: some View {

        switch style {

        case .selected:
            EmptyView()

        case .unselected:
            Capsule()
                .stroke(
                    AppColors.Border.default,
                    lineWidth: 1
                )
        }
    }
}
