//
//  ProfileView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct ProfileView: View {
    
    @Bindable var viewModel: ProfileViewModel
    @EnvironmentObject private var themeManager: ThemeManager
    @Environment(AppRouter.self) private var router
    @State private var isPremium = false

    private var name: String {
        viewModel.user?.fullName ?? "Your name"
    }

    private var initials: String {
        guard let fullName = viewModel.user?.fullName, !fullName.isEmpty else { return "?" }
        let parts = fullName.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first }
        return String(letters).uppercased()
    }

    private var showUpRateLabel: String {
        guard let rate = viewModel.user?.counts?.showUpRate else { return "—" }
        return "\(rate)%"
    }

    private var signInMethodLabel: String {
        if viewModel.user?.appleUserId != nil {
            return "Signed in with Apple"
        } else if viewModel.user?.googleUserId != nil {
            return "Signed in with Google"
        } else {
            return ""
        }
    }

    var body: some View {

        ScrollView {

            VStack(spacing: Spacing.md) {

                Picker("Preview plan", selection: $isPremium) {
                    Text("Free").tag(false)
                    Text("Premium").tag(true)
                }
                .pickerStyle(.segmented)

                titleRow

                userCard

                ProfilePlanCard(isPremium: isPremium, action: {})

                HStack(spacing: Spacing.sm) {
                    StatTile(value: "\(viewModel.user?.counts?.eventsGoing ?? 0)", label: "games played")
                    StatTile(value: showUpRateLabel, label: "show-up rate")
                }

                settingsList

                Button("Sign out") {
                    Task {
                        await viewModel.logout()
                        router.loggedOut()
                    }
                }
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Semantic.notGoing)
                    .padding(.top, Spacing.xs)
            }
            .padding(Spacing.screenPadding)
        }
        .background(AppColors.Background.subtle)
        .task { await viewModel.getMe() }
    }

    private var titleRow: some View {

        HStack {

            Text("Profile")
                .font(AppFont.title1)
                .foregroundStyle(AppColors.Text.primary)

            Spacer()

            Button(action: {
                themeManager.toggleTheme()
            }) {
                Image(systemName: themeManager.colorScheme == .light ? AppIcons.light_mode : AppIcons.dark_mode)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(AppColors.Text.primary)
                    .frame(width: 36, height: 36)
                    .background(AppColors.Background.card)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
    }

    private var userCard: some View {

        HStack(spacing: Spacing.sm) {

            ZStack(alignment: .bottomTrailing) {

                Circle()
                    .fill(AppColors.Brand.primary)
                    .frame(width: 52, height: 52)
                    .overlay {
                        Text(initials)
                            .font(AppFont.bodyStrong)
                            .foregroundStyle(.white)
                    }

                if isPremium {
                    Circle()
                        .fill(AppColors.Accent.energy)
                        .frame(width: 14, height: 14)
                        .overlay {
                            Circle().stroke(AppColors.Background.card, lineWidth: 2)
                        }
                }
            }

            VStack(alignment: .leading, spacing: 2) {

                HStack(spacing: Spacing.xs) {

                    Text(name)
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    if isPremium {
                        Text("PRO")
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundStyle(Color(red: 0x17 / 255, green: 0x15 / 255, blue: 0x1F / 255))
                            .padding(.horizontal, Spacing.xs)
                            .frame(height: 16)
                            .background(AppColors.Accent.energy)
                            .clipShape(Capsule())
                    }
                }

                Text(signInMethodLabel)
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            Spacer()

            Button(action: {}) {
                Text("Edit")
                    .font(AppFont.caption.bold())
                    .foregroundStyle(AppColors.Brand.primary)
                    .padding(.horizontal, Spacing.sm)
                    .frame(height: 30)
                    .background(AppColors.Brand.soft)
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private var settingsList: some View {

        VStack(spacing: 0) {

            SettingsRow(icon: AppIcons.reminder, title: "Notifications", action: {})
            Divider()
            SettingsRow(icon: AppIcons.calendar, title: "My availability", action: {})
            Divider()
            SettingsRow(icon: AppIcons.help, title: "Help & feedback", action: {})
        }
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }
}


