//
//  OnboardingFirstEventView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct OnboardingFirstEventView: View {

    @Bindable var viewModel: OnboardingViewModel
    let onContinue: () -> Void

    @State private var isPickingCustomDate = false
    @State private var customDate = Date()

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: Spacing.xs) {

                Text("First game?")
                    .font(AppFont.title1)
                    .foregroundStyle(AppColors.Text.primary)

                Text("Two taps. Fix details later.")
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.secondary)
            }
            .padding(.top, Spacing.xl)

            sectionLabel("WHEN")
                .padding(.top, Spacing.xxl)
                .padding(.bottom, Spacing.sm)

            VStack(spacing: Spacing.xs) {

                SelectableRow(
                    title: EventTimeOption.nextMonday.title,
                    subtitle: EventTimeOption.nextMonday.subtitle,
                    isSelected: viewModel.selectedTimeOption == .nextMonday
                ) {
                    viewModel.selectedTimeOption = .nextMonday
                }

                SelectableRow(
                    title: EventTimeOption.nextFriday.title,
                    isSelected: viewModel.selectedTimeOption == .nextFriday
                ) {
                    viewModel.selectedTimeOption = .nextFriday
                }

                SelectableRow(
                    title: customRowTitle,
                    isSelected: isCustomTimeSelected
                ) {
                    isPickingCustomDate = true
                }
            }

            sectionLabel("WHERE")
                .padding(.top, Spacing.xl)
                .padding(.bottom, Spacing.sm)

            HStack(spacing: Spacing.sm) {

                Circle()
                    .fill(AppColors.Brand.primary)
                    .frame(width: 8, height: 8)

                AppTextField(placeholder: "e.g. Neftçi Arena, Field 2", text: $viewModel.eventLocation)
            }

            Spacer(minLength: Spacing.xl)

            PrimaryButton(
                title: "Create event",
                action: onContinue
            )
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.bottom, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.Background.subtle)
        .sheet(isPresented: $isPickingCustomDate) {
            customDatePicker
        }
    }

    private var isCustomTimeSelected: Bool {
        if case .custom = viewModel.selectedTimeOption { return true }
        return false
    }

    private var customRowTitle: String {
        if case .custom(let date) = viewModel.selectedTimeOption {
            return date.formatted(date: .abbreviated, time: .shortened)
        }
        return "Pick another time"
    }

    private func sectionLabel(_ text: String) -> some View {

        Text(text)
            .font(AppFont.label)
            .foregroundStyle(AppColors.Text.tertiary)
    }

    private var customDatePicker: some View {

        ScrollView {
            VStack(spacing: Spacing.lg) {
                
                DatePicker("Event time", selection: $customDate)
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                
                PrimaryButton(title: "Done") {
                    viewModel.selectedTimeOption = .custom(customDate)
                    isPickingCustomDate = false
                }
            }
            .padding(Spacing.screenPadding)
            .presentationDetents([.medium])
        }
    }
}
