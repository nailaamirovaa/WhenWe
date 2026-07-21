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

            LazyVGrid(columns: columns, spacing: Spacing.sm) {

                ForEach(ActivityType.allCases) { type in

                    SelectionCard(
                        emoji: type.emoji,
                        title: type.title,
                        isSelected: viewModel.activitySelection == .preset(type)
                    ) {
                        viewModel.selectPreset(type)
                    }
                }

                SelectionCard(
                    emoji: "+",
                    title: "Other",
                    isSelected: viewModel.isAddingCustomActivity,
                    isDashed: true
                ) {
                    viewModel.selectOther()
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
                isEnabled: viewModel.canContinueFromGroupSetup,
                action: onContinue
            )
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.bottom, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.Background.subtle)
        .animation(.easeOut(duration: 0.2), value: viewModel.isAddingCustomActivity)
    }
}
