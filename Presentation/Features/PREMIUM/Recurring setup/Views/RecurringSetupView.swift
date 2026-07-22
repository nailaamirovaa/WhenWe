//
//  RecurringSetupView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct RecurringSetupView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = RecurringSetupViewModel()

    private let occurrences: [(label: String, isNext: Bool)] = [
        ("Mon Jul 27 · 20:00", true),
        ("Mon Aug 3 · 20:00", false),
        ("Mon Aug 10 · 20:00", false)
    ]

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: Spacing.md) {

                header

                summaryCard

                Text("REPEAT ON")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                    .padding(.top, Spacing.sm)

                dayPicker

                askGroupRow

                Text("NEXT UP")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                    .padding(.top, Spacing.sm)

                timeline

                Spacer(minLength: Spacing.xl)

                PrimaryButton(title: "Turn on recurring", action: { dismiss() })
            }
            .padding(Spacing.screenPadding)
        }
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }

    private var header: some View {

        HStack(spacing: Spacing.sm) {

            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(AppColors.Text.primary)
                    .frame(width: 40, height: 40)
                    .background(AppColors.Background.card)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
            }
            .buttonStyle(.plain)

            Text("Make it weekly")
                .font(AppFont.title2)
                .foregroundStyle(AppColors.Text.primary)

            Text("PRO")
                .font(AppFont.label)
                .foregroundStyle(AppColors.Brand.primary)
                .padding(.horizontal, Spacing.xs)
                .frame(height: 20)
                .background(AppColors.Brand.soft)
                .clipShape(Capsule())
        }
        .padding(.top, Spacing.lg)
    }

    private var summaryCard: some View {

        VStack(alignment: .leading, spacing: Spacing.xxs) {

            Text(viewModel.summaryTitle)
                .font(.system(size: 22, weight: .heavy))
                .foregroundStyle(AppColors.Text.primary)

            Text("The app asks your group every Saturday. You just play.")
                .font(AppFont.caption.bold())
                .foregroundStyle(AppColors.Brand.primaryPressed)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg)
        .background(AppColors.Brand.soft)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private var dayPicker: some View {

        HStack(spacing: Spacing.xs) {
            ForEach(viewModel.dayLabels.indices, id: \.self) { index in
                dayPill(index)
            }
        }
    }

    private func dayPill(_ index: Int) -> some View {

        let isSelected = viewModel.selectedDays.contains(index)

        return Button {
            viewModel.toggleDay(index)
        } label: {
            Text(viewModel.dayLabels[index])
                .font(.system(size: 14, weight: isSelected ? .heavy : .bold))
                .foregroundStyle(isSelected ? .white : AppColors.Text.secondary)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(isSelected ? AppColors.Brand.primary : AppColors.Background.card)
                .overlay(
                    Capsule().stroke(isSelected ? Color.clear : AppColors.Border.default, lineWidth: 1.5)
                )
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }

    private var askGroupRow: some View {

        HStack {

            Text("Ask the group")
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Text.primary)

            Spacer()

            Text(viewModel.askGroupSchedule)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(AppColors.Brand.primary)
                .padding(.horizontal, Spacing.sm)
                .frame(height: 34)
                .background(AppColors.Background.subtle)
                .clipShape(Capsule())
        }
        .padding(.horizontal, Spacing.md)
        .frame(height: 60)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
    }

    private var timeline: some View {

        VStack(alignment: .leading, spacing: 0) {

            ForEach(Array(occurrences.enumerated()), id: \.offset) { index, occurrence in

                HStack(spacing: Spacing.sm) {

                    Circle()
                        .fill(occurrence.isNext ? AppColors.Brand.primary : Color(red: 0xDC / 255, green: 0xD4 / 255, blue: 0xFB / 255))
                        .frame(width: 10, height: 10)

                    Text(occurrence.label)
                        .font(occurrence.isNext ? AppFont.bodyStrong : AppFont.body)
                        .foregroundStyle(occurrence.isNext ? AppColors.Text.primary : AppColors.Text.secondary)
                }

                if index != occurrences.count - 1 {
                    Rectangle()
                        .fill(AppColors.Border.default)
                        .frame(width: 2, height: 14)
                        .padding(.leading, 4)
                }
            }
        }
    }
}
