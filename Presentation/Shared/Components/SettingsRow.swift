//
//  SettingsRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct SettingsRow: View {

    let icon: String
    let title: String
    var tint: Color = AppColors.Text.primary
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: Spacing.sm) {

                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(tint)
                    .frame(width: 28)

                Text(title)
                    .font(AppFont.body)
                    .foregroundStyle(tint)

                Spacer()

                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(AppColors.Text.tertiary)
            }
            .padding(.horizontal, Spacing.md)
            .frame(height: 52)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 0) {
        SettingsRow(icon: AppIcons.reminder, title: "Notifications", action: {})
        SettingsRow(icon: AppIcons.signOut, title: "Sign out", tint: AppColors.Semantic.notGoing, action: {})
    }
    .background(AppColors.Background.card)
    .padding()
}
