//
//  SelectableRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct SelectableRow: View {

    let title: String
    var subtitle: String? = nil
    var isSelected: Bool = false
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: Spacing.sm) {

                VStack(alignment: .leading, spacing: 2) {

                    Text(title)
                        .font(isSelected ? AppFont.bodyStrong : AppFont.body)
                        .foregroundStyle(isSelected ? AppColors.Text.primary : AppColors.Text.secondary)

                    if let subtitle {
                        Text(subtitle)
                            .font(AppFont.caption)
                            .foregroundStyle(AppColors.Text.secondary)
                    }
                }

                Spacer()

                if isSelected {
                    Circle()
                        .fill(AppColors.Brand.primary)
                        .frame(width: 22, height: 22)
                        .overlay {
                            Image(systemName: AppIcons.checkmark)
                                .font(.system(size: 11, weight: .heavy))
                                .foregroundStyle(.white)
                        }
                }
            }
            .padding(.horizontal, Spacing.md)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(isSelected ? AppColors.Brand.soft : AppColors.Background.card)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.medium)
                    .stroke(isSelected ? AppColors.Brand.primary : AppColors.Border.default, lineWidth: 1.5)
            )
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: Spacing.sm) {
        SelectableRow(title: "Next Monday · 20:00", subtitle: "Jul 27", isSelected: true) {}
        SelectableRow(title: "Next Friday · 21:00") {}
        SelectableRow(title: "Pick another time") {}
    }
    .padding()
}
