//
//  ProfilePlanCard.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct ProfilePlanCard: View {

    let isPremium: Bool
    let action: () -> Void

    private let inkColor = Color(red: 0x17 / 255, green: 0x15 / 255, blue: 0x1F / 255)

    var body: some View {

        Group {
            if isPremium {
                Button(action: action) { cardContent }
                    .buttonStyle(.plain)
            } else {
                cardContent
            }
        }
    }

    private var cardContent: some View {

        HStack(spacing: Spacing.sm) {

            Image(systemName: AppIcons.bolt)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(inkColor)
                .frame(width: 32, height: 32)
                .background(AppColors.Accent.energy)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {

                Text(isPremium ? "Organizer Pro · Annual" : "Go Organizer Pro")
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(.white)

                Text(isPremium ? "Renews Mar 3, 2027" : "Recurring games, waitlist, stats")
                    .font(AppFont.caption)
                    .foregroundStyle(.white.opacity(0.6))
            }

            Spacer()

            if isPremium {
                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.5))
            } else {
                Button(action: action) {
                    Text("Try free")
                        .font(AppFont.caption.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, Spacing.sm)
                        .frame(height: 32)
                        .background(AppColors.Brand.primary)
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(Spacing.md)
        .background(inkColor)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }
}

#Preview {
    VStack(spacing: Spacing.md) {
        ProfilePlanCard(isPremium: false, action: {})
        ProfilePlanCard(isPremium: true, action: {})
    }
    .padding()
    .background(AppColors.Background.subtle)
}
