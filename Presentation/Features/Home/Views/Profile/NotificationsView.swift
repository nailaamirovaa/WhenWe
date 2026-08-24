//
//  NotificationsView.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct NotificationsView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = NotificationsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            PrimaryHeader(title: "Notifications") {
                dismiss()
            }
            .padding(.horizontal)

            if viewModel.isLoading && viewModel.preferences == nil {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.top, Spacing.xl)
            } else {
                Text("GAMES")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                    .padding(.horizontal)
                    .padding(.top)

                VStack {
                    ToggleRow(title: "New Game posted", subtitle: "When someone plans a game", isOn: binding(\.newGamePosted) { NotificationPreferencesInput(newGamePosted: $0) })

                    Divider()

                    ToggleRow(title: "RSVP changes", subtitle: "Someone joins or drops out", isOn: binding(\.rsvpChanges) { NotificationPreferencesInput(rsvpChanges: $0) })

                    Divider()

                    ToggleRow(title: "Games confirmed", subtitle: "Enough players - it's on", isOn: binding(\.gameConfirmed) { NotificationPreferencesInput(gameConfirmed: $0) })
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                .padding(.horizontal)

                Text("REMINDERS")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                    .padding(.horizontal)

                VStack {
                    ToggleRow(title: "Day-before nudge", subtitle: "Haven't RSVP'd yet", isOn: binding(\.dayBeforeNudge) { NotificationPreferencesInput(dayBeforeNudge: $0) })

                    Divider()

                    ToggleRow(title: "Attendance check", subtitle: "After a game, did you show up?", isOn: binding(\.attendanceCheck) { NotificationPreferencesInput(attendanceCheck: $0) })

                    Divider()

                    ToggleRow(title: "Weekly recurring ask", subtitle: "Your Saturday football poll", isOn: binding(\.weeklyRecurringAsk) { NotificationPreferencesInput(weeklyRecurringAsk: $0) })
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                .padding(.horizontal)
            }

            Spacer()
        }
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .task { await viewModel.load() }
    }

    private func binding(_ keyPath: KeyPath<NotificationPreferences, Bool>, input: @escaping (Bool) -> NotificationPreferencesInput) -> Binding<Bool> {
        Binding(
            get: { viewModel.preferences?[keyPath: keyPath] ?? true },
            set: { newValue in
                Task { await viewModel.update(input(newValue)) }
            }
        )
    }
}

#Preview {
    NotificationsView()
}
