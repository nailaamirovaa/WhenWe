//
//  EventDetailView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct EventDetailView: View {

    @Bindable var viewModel: EventDetailViewModel

    let group: GroupSummary

    @Environment(\.dismiss) private var dismiss

    @State private var isShowingStats = false
    @State private var isShowingPayments = false

    private let payments = EventPayments.sample

    private let avatarPalette: [Color] = [AppColors.Brand.primary, .orange, AppColors.Semantic.going, .blue, .pink]

    init(group: GroupSummary, event: Event) {
        self.group = group
        self.viewModel = EventDetailViewModel(event: event)
    }

    private var total: Int { viewModel.event.capacity ?? 0 }

    private var progress: Double {
        let going = viewModel.event.counts?.going ?? 0
        return total > 0 ? Double(going) / Double(total) : 0
    }

    private var status: GroupEventStatus { viewModel.event.groupEventStatus }

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

                    paymentsCard

                    Text("ARE YOU IN?")
                        .font(AppFont.label)
                        .foregroundStyle(AppColors.Text.tertiary)
                        .padding(.top, Spacing.sm)

                    RSVPChipGroup(onSelect: selectRSVP, selection: viewModel.myRSVP ?? .going)

                    attendeeList
                }
                .padding(Spacing.screenPadding)
                .padding(.bottom, Spacing.xxxl)

                Spacer(minLength: 50)
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
        .padding(.top, Spacing.xxl)
        .ignoresSafeArea()
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .animation(.easeOut(duration: 0.25), value: isConfirmed)
        .navigationDestination(isPresented: $isShowingStats) {
            GroupStatsView(group: group)
        }
        .navigationDestination(isPresented: $isShowingPayments) {
            PaymentsView()
        }
        .task {
            await viewModel.loadCurrentUser()
            await viewModel.refresh()
        }
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

                HStack(spacing: Spacing.xs) {

                    Button(action: { isShowingStats = true }) {
                        HStack(spacing: 4) {
                            Text("📊")
                                .font(.system(size: 12))
                            Text("Stats")
                                .font(AppFont.caption.bold())
                        }
                        .foregroundStyle(AppColors.Brand.primary)
                        .padding(.horizontal, Spacing.md)
                        .frame(height: 40)
                        .background(AppColors.Background.card)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
                    }
                    .buttonStyle(.plain)

                    Text("Share link")
                        .font(AppFont.caption.bold())
                        .foregroundStyle(AppColors.Brand.primary)
                        .padding(.horizontal, Spacing.md)
                        .frame(height: 40)
                        .background(AppColors.Background.card)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
                }
            }

            HStack(spacing: Spacing.sm) {

                Text(group.emoji)
                    .font(.system(size: 40))

                VStack(alignment: .leading, spacing: 2) {

                    Text(viewModel.event.title ?? "")
                        .font(AppFont.title2)
                        .foregroundStyle(AppColors.Text.primary)

                    Text(viewModel.event.startsAtDate?.formatted(.dateTime.weekday(.wide).month().day().hour().minute()) ?? "")
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
                Text("map snippet · \(viewModel.event.locationName ?? "")")
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

                Text("\(viewModel.event.counts?.going ?? 0)/\(total) going")
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

    private var paymentsCard: some View {

        VStack(alignment: .leading, spacing: Spacing.sm) {

            HStack(spacing: Spacing.md) {

                Text("💰")
                    .font(.system(size: 22))
                    .frame(width: 44, height: 44)
                    .background(AppColors.Semantic.going.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))

                VStack(alignment: .leading, spacing: 2) {

                    Text("\(payments.currencySymbol)\(payments.amountPerPlayer) per player · pitch fee")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundStyle(AppColors.Text.primary)

                    Text("\(payments.paidCount) of \(payments.totalCount) paid · \(payments.currencySymbol)\(payments.collected) collected")
                        .font(AppFont.caption.bold())
                        .foregroundStyle(AppColors.Semantic.going)
                }

                Spacer()
            }

            GeometryReader { proxy in
                Capsule()
                    .fill(AppColors.Background.subtle)
                    .overlay(alignment: .leading) {
                        Capsule()
                            .fill(AppColors.Semantic.going)
                            .frame(width: proxy.size.width * payments.progress)
                    }
            }
            .frame(height: 8)

            Button(action: { isShowingPayments = true }) {
                HStack(spacing: Spacing.xs) {
                    Image(systemName: "creditcard")
                        .font(.system(size: 13, weight: .semibold))

                    Text("See who paid")
                        .font(.system(size: 14, weight: .heavy))

                    Text("PRO")
                        .font(.system(size: 10, weight: .heavy))
                        .padding(.horizontal, 6)
                        .frame(height: 20)
                        .background(AppColors.Brand.soft)
                        .clipShape(Capsule())
                }
                .foregroundStyle(AppColors.Brand.primary)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(AppColors.Background.subtle)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
            }
            .buttonStyle(.plain)
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private func rsvps(for response: String) -> [Rsvp] {
        viewModel.event.rsvps?.filter { $0.response == response } ?? []
    }

    private var goingNames: [String] { rsvps(for: "going").compactMap { $0.membershipDisplayName } }
    private var maybeNames: [String] { rsvps(for: "maybe").compactMap { $0.membershipDisplayName } }
    private var cantNames: [String] { rsvps(for: "not_going").compactMap { $0.membershipDisplayName } }

    private var attendeeList: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            attendeeSection(
                dotColor: AppColors.Semantic.going,
                label: "GOING · \(viewModel.event.counts?.going ?? 0)",
                names: goingNames,
                showAvatars: true
            )

            attendeeSection(
                dotColor: AppColors.Semantic.maybe,
                label: "MAYBE · \(viewModel.event.counts?.maybe ?? 0)",
                names: maybeNames,
                showAvatars: false
            )

            attendeeSection(
                dotColor: AppColors.Semantic.notGoing,
                label: "CAN'T · \(viewModel.event.counts?.notGoing ?? 0)",
                names: cantNames,
                showAvatars: false
            )
        }
    }

    private func attendeeSection(dotColor: Color, label: String, names: [String], showAvatars: Bool) -> some View {

        VStack(alignment: .leading, spacing: Spacing.xs) {

            HStack(spacing: Spacing.xs) {
                Circle().fill(dotColor).frame(width: 8, height: 8)

                Text(label)
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            if showAvatars && !names.isEmpty {

                let shown = Array(names.prefix(5))
                let overflow = names.count - shown.count

                HStack(spacing: Spacing.sm) {

                    HStack(spacing: -8) {
                        ForEach(Array(shown.enumerated()), id: \.offset) { index, name in
                            avatarBubble(initials(from: name), avatarPalette[index % avatarPalette.count])
                        }
                        if overflow > 0 {
                            avatarBubble("+\(overflow)", .pink)
                        }
                    }

                    Text(names.joined(separator: ", "))
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }

            } else {

                Text(names.isEmpty ? "No one yet" : names.joined(separator: ", "))
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }
        }
    }

    private func initials(from name: String) -> String {
        let parts = name.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first }
        return String(letters).uppercased()
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
        Task {
            await viewModel.submitRSVP(choice)
        }
    }
}
