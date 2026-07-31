//
//  OnboardingWelcomeView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct OnboardingWelcomeView: View {

    let onCreateGroup: () -> Void
    let onHaveInviteLink: () -> Void

    @State private var showBadges = false

    var body: some View {

        VStack(spacing: 0) {

            HStack(spacing: Spacing.xs) {

                RoundedRectangle(cornerRadius: 9)
                    .fill(AppColors.Brand.primary)
                    .frame(width: 28, height: 28)
                    .overlay {
                        Text("W")
                            .font(.system(size: 15, weight: .black))
                            .foregroundStyle(.white)
                    }

                Text("WhenWe")
                    .font(.system(size: 17, weight: .heavy))
                    .foregroundStyle(AppColors.Text.primary)

                Spacer()
            }

            heroMock
                .frame(maxHeight: .infinity)
                .padding(.vertical, Spacing.md)

            VStack(alignment: .leading, spacing: Spacing.sm) {

                Text("Skip the “who's in?” chaos")
                    .font(AppFont.display)
                    .foregroundStyle(AppColors.Text.primary)
                    .fixedSize(horizontal: false, vertical: true)

                Text("One link. Everyone answers. Game on.")
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            PrimaryButton(title: "Create your group", action: onCreateGroup)
                .padding(.top, Spacing.xl)

            Button(action: onHaveInviteLink) {
                Text("I got an invite link")
                    .font(AppFont.caption.bold())
                    .foregroundStyle(AppColors.Text.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.top, Spacing.md)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.top, Spacing.xxl)
        .padding(.bottom, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [AppColors.Brand.soft, AppColors.Background.subtle],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .onAppear {
            withAnimation(.easeOut(duration: 0.5).delay(0.2)) {
                showBadges = true
            }
        }
    }

    private var heroMock: some View {

        ZStack {

            VStack(alignment: .leading, spacing: Spacing.sm) {

                HStack(spacing: Spacing.sm) {

                    Text("⚽")
                        .font(.system(size: 28))

                    VStack(alignment: .leading, spacing: 2) {

                        Text("Monday Football")
                            .font(AppFont.title2)
                            .foregroundStyle(AppColors.Text.primary)

                        Text("Mon · 20:00 · Neftçi Arena")
                            .font(AppFont.caption)
                            .foregroundStyle(AppColors.Text.secondary)
                    }
                }

                HStack(spacing: Spacing.sm) {

                    HStack(spacing: -8) {
                        avatar(initials: "EA", color: AppColors.Brand.primary)
                        avatar(initials: "TQ", color: .orange)
                        avatar(initials: "NM", color: AppColors.Semantic.going)
                        avatar(initials: "+3", color: .blue)
                    }

                    Text("6/10 going")
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)
                        .monospacedDigit()
                }
            }
            .padding(Spacing.md)
            .frame(width: 350, alignment: .leading)
            .background(AppColors.Background.card)
            .clipShape(RoundedRectangle(cornerRadius: Radius.large))
            .shadow(color: .black.opacity(0.12), radius: 20, y: 14)
            .rotationEffect(.degrees(-2))

            badge(text: "Rauf is in ✔")
                .offset(x: 92, y: -78)
                .opacity(showBadges ? 1 : 0)
                .scaleEffect(showBadges ? 1 : 0.7)

            badge(text: "Aysel is in ✔")
                .offset(x: -100, y: 88)
                .opacity(showBadges ? 1 : 0)
                .scaleEffect(showBadges ? 1 : 0.7)
        }
    }

    private func avatar(initials: String, color: Color) -> some View {

        Circle()
            .fill(color)
            .frame(width: 30, height: 30)
            .overlay {
                Text(initials)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white)
            }
            .overlay {
                Circle().stroke(AppColors.Background.card, lineWidth: 2)
            }
    }

    private func badge(text: String) -> some View {

        Text(text)
            .font(AppFont.caption.bold())
            .foregroundStyle(AppColors.Text.primary)
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, Spacing.xs)
            .background(AppColors.Background.card)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.14), radius: 12, y: 6)
    }
}
