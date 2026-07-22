//
//  CreateEventOptionsStepView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct CreateEventOptionsStepView: View {

    @Bindable var viewModel: CreateEventViewModel
    let onBack: () -> Void
    let onCreate: () -> Void

    @State private var isShowingRecurringSetup = false

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            HStack(spacing: Spacing.sm) {

                Button(action: onBack) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(AppColors.Text.primary)
                        .frame(width: 32, height: 32)
                        .background(AppColors.Background.subtle)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)

                Text("Options")
                    .font(AppFont.title2)
                    .foregroundStyle(AppColors.Text.primary)

                Spacer()

                Text("2/2")
                    .font(AppFont.caption.bold())
                    .foregroundStyle(AppColors.Text.tertiary)
                    .monospacedDigit()
            }
            .padding(.bottom, Spacing.xs)

            optionRow(title: "Min players") {
                HStack(spacing: Spacing.md) {

                    stepperButton(symbol: "−") {
                        viewModel.minPlayers = max(1, viewModel.minPlayers - 1)
                    }

                    Text("\(viewModel.minPlayers)")
                        .font(.system(size: 18, weight: .heavy))
                        .monospacedDigit()
                        .foregroundStyle(AppColors.Text.primary)
                        .frame(minWidth: 24)

                    stepperButton(symbol: "+", tinted: true) {
                        viewModel.minPlayers += 1
                    }
                }
            }

            Divider()

            optionRow(title: "Cost per person") {
                HStack(spacing: 2) {
                    Text("$")
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    TextField("0", text: $viewModel.costPerPerson)
                        .font(AppFont.bodyStrong)
                        .monospacedDigit()
                        .foregroundStyle(AppColors.Text.primary)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, Spacing.sm)
                .frame(width: 90, height: 40)
                .background(AppColors.Background.subtle)
                .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            }

            Divider()

            proToggleRow(
                title: "Waitlist",
                subtitle: "Fills dropped spots automatically",
                isOn: $viewModel.waitlistEnabled
            )

            Divider()

            proToggleRow(
                title: "Auto-reminders",
                subtitle: "Nudge the silent ones day before",
                isOn: $viewModel.autoRemindersEnabled
            )

            recurringCard
                .padding(.top, Spacing.xs)

            PrimaryButton(title: "Create event", action: onCreate)
                .padding(.top, Spacing.md)
        }
        .sheet(isPresented: $isShowingRecurringSetup) {
            RecurringSetupView()
        }
    }

    private var recurringCard: some View {

        Button(action: { isShowingRecurringSetup = true }) {

            HStack(spacing: Spacing.md) {

                Text(AppIcons.recurring)
                    .font(.system(size: 22))
                    .frame(width: 44, height: 44)
                    .background(AppColors.Brand.primary)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))

                VStack(alignment: .leading, spacing: 2) {

                    HStack(spacing: Spacing.xs) {
                        Text("Make this repeat weekly")
                            .font(.system(size: 15, weight: .heavy))
                            .foregroundStyle(AppColors.Text.primary)

                        Text("PRO")
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundStyle(AppColors.Brand.primary)
                            .padding(.horizontal, Spacing.xs)
                            .frame(height: 20)
                            .background(AppColors.Background.card)
                            .clipShape(Capsule())
                    }

                    Text("Auto-ask the group every week — set & forget")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }

                Spacer()

                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(AppColors.Brand.primary)
            }
            .padding(Spacing.md)
            .background(
                LinearGradient(
                    colors: [AppColors.Brand.soft, Color(red: 0xE4 / 255, green: 0xDC / 255, blue: 0xFF / 255)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: Radius.large)
                    .stroke(Color(red: 0xDC / 255, green: 0xD4 / 255, blue: 0xFB / 255), lineWidth: 1.5)
            )
            .clipShape(RoundedRectangle(cornerRadius: Radius.large))
        }
        .buttonStyle(.plain)
    }

    private func optionRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {

        HStack {
            Text(title)
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Text.primary)

            Spacer()

            content()
        }
        .padding(.vertical, Spacing.md)
    }

    private func proToggleRow(title: String, subtitle: String, isOn: Binding<Bool>) -> some View {

        HStack {

            VStack(alignment: .leading, spacing: 2) {

                HStack(spacing: Spacing.xs) {
                    Text(title)
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    proBadge
                }

                Text(subtitle)
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            Spacer()

            Toggle("", isOn: isOn)
                .labelsHidden()
                .tint(AppColors.Brand.primary)
        }
        .padding(.vertical, Spacing.md)
    }

    private var proBadge: some View {

        HStack(spacing: 2) {
            Image(systemName: AppIcons.locked)
                .font(.system(size: 8))
            Text("PRO")
                .font(.system(size: 10, weight: .heavy))
        }
        .foregroundStyle(AppColors.Brand.primary)
        .padding(.horizontal, Spacing.xs)
        .frame(height: 20)
        .background(AppColors.Brand.soft)
        .clipShape(Capsule())
    }

    private func stepperButton(symbol: String, tinted: Bool = false, action: @escaping () -> Void) -> some View {

        Button(action: action) {
            Text(symbol)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(tinted ? AppColors.Brand.primary : AppColors.Text.secondary)
                .frame(width: 36, height: 36)
                .background(tinted ? AppColors.Brand.soft : AppColors.Background.subtle)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}
