//
//  OnboardingGroupSetupView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct OnboardingGroupSetupView: View {

    @Bindable var viewModel: OnboardingViewModel
    let onContinue: () -> Void

    private let columns = Array(repeating: GridItem(.flexible(), spacing: Spacing.sm), count: 3)

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: Spacing.xs) {

                Text("Name your group")
                    .font(AppFont.title1)
                    .foregroundStyle(AppColors.Text.primary)

                Text("You can change it anytime.")
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.secondary)
            }
            .padding(.top, Spacing.xl)

            AppTextField(placeholder: "e.g. Monday Legends", text: $viewModel.groupName)
                .padding(.top, Spacing.xl)

            Text("WHAT DO YOU PLAY?")
                .font(AppFont.label)
                .foregroundStyle(AppColors.Text.tertiary)
                .padding(.top, Spacing.xxl)
                .padding(.bottom, Spacing.sm)

            VStack(spacing: Spacing.sm) {

                HStack(spacing: Spacing.sm) {
                    ForEach(Array(ActivityType.allCases.prefix(3))) { card(for: $0) }
                }

                HStack(spacing: Spacing.sm) {
                    ForEach(Array(ActivityType.allCases.dropFirst(3))) { card(for: $0) }

                    SelectionCard(emoji: "+", title: "Other",
                                  isSelected: viewModel.isAddingCustomActivity,
                                  isDashed: true) {
                        viewModel.selectOther()
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            if viewModel.isAddingCustomActivity {

                AppTextField(placeholder: "Name your activity", text: Binding(
                    get: { viewModel.customActivityName },
                    set: { viewModel.updateCustomActivityName($0) }
                ))
                .padding(.top, Spacing.sm)
            }

            Spacer(minLength: Spacing.xl)

            PrimaryButton(
                title: "Continue",
                action: onContinue
            )
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.bottom, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.Background.subtle)
        .animation(.easeOut(duration: 0.2), value: viewModel.isAddingCustomActivity)
    }
    
    private func card(for type: ActivityType) -> some View {
        SelectionCard(
            emoji: type.emoji,
            title: type.title,
            isSelected: viewModel.activitySelection == .preset(type)
        ) {
            viewModel.selectPreset(type)
        }
        .frame(maxWidth: .infinity)
    }
}
