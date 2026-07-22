//
//  GroupStatsView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct GroupStatsView: View {

    let group: GroupSummary

    @Environment(\.dismiss) private var dismiss

    private let stats = GroupStats.sample

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: Spacing.md) {

                header

                highlightCard

                Text("ATTENDANCE")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                    .padding(.top, Spacing.sm)

                attendanceCard

                HStack(spacing: Spacing.sm) {
                    StatHighlightTile(emoji: "🏆", label: "Most reliable", value: stats.mostReliable)
                    StatHighlightTile(emoji: "🫠", label: "Most flaky", value: stats.mostFlaky)
                }

                Spacer(minLength: 140)

                PrimaryButton(title: "Share as image", action: {})
            }
            .padding(Spacing.screenPadding)
        }
        .padding(.top, Spacing.xxl)
        .ignoresSafeArea()
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

            Text(stats.title)
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

    private var highlightCard: some View {

        VStack(alignment: .leading, spacing: Spacing.xxs) {

            Text(stats.headline)
                .font(.system(size: 26, weight: .heavy))
                .foregroundStyle(.textPrimary)

            Text(stats.subheadline)
                .font(AppFont.bodyStrong)
                .foregroundStyle(.textPrimary.opacity(0.7))
                .monospacedDigit()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.lg)
        .background(AppColors.Accent.energy)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private var attendanceCard: some View {

        VStack(spacing: 0) {

            ForEach(stats.attendance) { entry in

                AttendanceRow(entry: entry)

                if entry.id != stats.attendance.last?.id {
                    Divider()
                }
            }
        }
        .padding(.horizontal, Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }
}

#Preview {
    NavigationStack {
        GroupStatsView(group: GroupSummary.samples[0])
    }
}
