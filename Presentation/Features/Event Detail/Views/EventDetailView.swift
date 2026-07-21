//
//  EventDetailView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct EventDetailView: View {

    let group: GroupSummary

    @Environment(\.dismiss) private var dismiss

    @State private var myRSVP: RSVPChoice? = .going
    @State private var goingCount: Int
    @State private var maybeCount = 2
    @State private var cantCount = 1

    init(group: GroupSummary) {
        self.group = group
        _goingCount = State(initialValue: group.nextEvent.going)
    }

    private var total: Int { group.nextEvent.total }

    private var progress: Double {
        total > 0 ? Double(goingCount) / Double(total) : 0
    }

    private var status: GroupEventStatus {
        goingCount >= group.nextEvent.minimumRequired
            ? .confirmed
            : .needsMore(group.nextEvent.minimumRequired - goingCount)
    }

    private var isConfirmed: Bool {
        if case .confirmed = status { return true }
        return false
    }

    var body: some View {

        ZStack(alignment: .bottom) {

            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.md) {

                    header

                    mapPlaceholder

                    goingSummaryCard

                    Text("ARE YOU IN?")
                        .font(AppFont.label)
                        .foregroundStyle(AppColors.Text.tertiary)
                        .padding(.top, Spacing.sm)

                    RSVPChipGroup(selection: myRSVP, onSelect: selectRSVP)

                    attendeeList
                }
                .padding(Spacing.screenPadding)
                .padding(.bottom, Spacing.xxxl)
            }

            if isConfirmed {

                Text("Game on! 🎉 Minimum reached")
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(.white)
                    .padding(.horizontal, Spacing.md)
                    .frame(height: 48)
                    .background(Color(red: 0x17 / 255, green: 0x15 / 255, blue: 0x1F / 255))
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                    .shadow(color: .black.opacity(0.25), radius: 20, y: 10)
                    .padding(.bottom, Spacing.xl)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .animation(.easeOut(duration: 0.25), value: isConfirmed)
    }

    private var header: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            HStack {

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

                Spacer()

                Text("Share link")
                    .font(AppFont.caption.bold())
                    .foregroundStyle(AppColors.Brand.primary)
                    .padding(.horizontal, Spacing.md)
                    .frame(height: 40)
                    .background(AppColors.Background.card)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
            }

            HStack(spacing: Spacing.sm) {

                Text(group.emoji)
                    .font(.system(size: 40))

                VStack(alignment: .leading, spacing: 2) {

                    Text(group.nextEvent.title)
                        .font(AppFont.title2)
                        .foregroundStyle(AppColors.Text.primary)

                    Text(group.nextEvent.dayTime)
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }
            }
        }
        .padding(.top, Spacing.lg)
    }

    private var mapPlaceholder: some View {

        RoundedRectangle(cornerRadius: Radius.large)
            .fill(AppColors.Background.card)
            .frame(height: 82)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.large)
                    .stroke(AppColors.Border.default, lineWidth: 1)
            )
            .overlay {
                Text("map snippet · \(group.nextEvent.location)")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundStyle(AppColors.Text.secondary)
                    .padding(.horizontal, Spacing.xs)
                    .padding(.vertical, 3)
                    .background(AppColors.Background.card.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
    }

    private var goingSummaryCard: some View {

        HStack(spacing: Spacing.md) {

            CircularProgressRing(progress: progress, color: status.ringColor)
                .frame(width: 64, height: 64)

            VStack(alignment: .leading, spacing: Spacing.xxs) {

                Text("\(goingCount)/\(total) going")
                    .font(.system(size: 22, weight: .heavy))
                    .monospacedDigit()
                    .foregroundStyle(AppColors.Text.primary)

                EventStatusBadge(status: status)
            }

            Spacer()
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private var attendeeList: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            attendeeSection(
                dotColor: AppColors.Semantic.going,
                label: "GOING · \(goingCount)",
                names: "Emin, Tural, Nihad +4",
                showAvatars: true
            )

            attendeeSection(
                dotColor: AppColors.Semantic.maybe,
                label: "MAYBE · \(maybeCount)",
                names: "Kamran, Orxan",
                showAvatars: false
            )

            attendeeSection(
                dotColor: AppColors.Semantic.notGoing,
                label: "CAN'T · \(cantCount)",
                names: "Farid",
                showAvatars: false
            )
        }
    }

    private func attendeeSection(dotColor: Color, label: String, names: String, showAvatars: Bool) -> some View {

        VStack(alignment: .leading, spacing: Spacing.xs) {

            HStack(spacing: Spacing.xs) {
                Circle().fill(dotColor).frame(width: 8, height: 8)

                Text(label)
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            if showAvatars {

                HStack(spacing: Spacing.sm) {

                    HStack(spacing: -8) {
                        avatarBubble("EA", AppColors.Brand.primary)
                        avatarBubble("TQ", .orange)
                        avatarBubble("NM", AppColors.Semantic.going)
                        avatarBubble("AH", .blue)
                        avatarBubble("+3", .pink)
                    }

                    Text(names)
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }

            } else {

                Text(names)
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }
        }
    }

    private func avatarBubble(_ initials: String, _ color: Color) -> some View {

        Circle()
            .fill(color)
            .frame(width: 32, height: 32)
            .overlay {
                Text(initials)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white)
            }
            .overlay {
                Circle().stroke(AppColors.Background.subtle, lineWidth: 2)
            }
    }

    private func selectRSVP(_ choice: RSVPChoice) {

        guard choice != myRSVP else { return }

        if let previous = myRSVP {
            adjust(previous, by: -1)
        }
        adjust(choice, by: 1)

        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            myRSVP = choice
        }
    }

    private func adjust(_ choice: RSVPChoice, by delta: Int) {
        switch choice {
        case .going: goingCount = max(0, goingCount + delta)
        case .maybe: maybeCount = max(0, maybeCount + delta)
        case .cant: cantCount = max(0, cantCount + delta)
        }
    }
}

