//
//  MyAvailabilityView.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct MyAvailabilityView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = AvailabilityViewModel()

    @State private var availability: [DayHour: AvailabilityCellState] = [:]
    @State private var toast: (title: String, style: ToastStyle)?

    private let days = AvailabilityViewModel.days
    private let hours = AvailabilityViewModel.hours

    var body: some View {
        VStack(alignment: .leading,spacing: Spacing.sm) {
            PrimaryHeader(title: "My Availability") {
                dismiss()
            }

            Text("Tap each hour you’re usually free. Games in these slots reach you first.")
                .font(AppFont.body)
                .foregroundStyle(AppColors.Text.tertiary)

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
            } else {
                gridView
            }

            HStack(alignment: .center, spacing: Spacing.sm) {

                Spacer()

                ForEach(AvailabilityCellState.allCases, id: \.self) { state in

                    HStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 16, height: 16)
                            .foregroundStyle(state.color)

                        Text(state.title)
                            .font(AppFont.subLabel)
                            .foregroundStyle(AppColors.Text.secondary)
                    }
                }

                Spacer()
            }

            Spacer()


            PrimaryButton(title: "Save Availability", state: viewModel.isSaving ? .loading : .normal) {
                Task { await save() }
            }
        }
        .padding(Spacing.screenPadding)
        .background(AppColors.Background.card)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .overlay(alignment: .bottom) {
            if let toast {
                Toast(title: toast.title, style: toast.style)
                    .padding(.horizontal, Spacing.screenPadding)
                    .padding(.bottom, Spacing.xl)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .task {
            availability = await viewModel.load()
        }
    }

    private var gridView: some View {
        ScrollView {
            Grid(horizontalSpacing: 6, verticalSpacing: 6) {
                GridRow {
                    Text("")
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                ForEach(hours, id: \.self) { hour in
                    GridRow {
                        Text(hour)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        ForEach(days, id: \.self) { day in
                            cell(day: day, hour: hour)
                        }
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .frame(height: 500)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private func cell(day: String, hour: String) -> some View {
        let key = DayHour(day: day, hour: hour)
        let state = availability[key, default: .busy]

        return RoundedRectangle(cornerRadius: 6)
            .fill(state.color)
            .frame(width: 36, height: 26)
            .onTapGesture {
                availability[key] = state.next
            }
    }

    private func save() async {
        let success = await viewModel.save(availability)

        withAnimation(.easeOut(duration: 0.2)) {
            toast = success
                ? ("Availability saved", .success)
                : ("Couldn't save. Try again.", .error)
        }

        Task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeOut(duration: 0.2)) { toast = nil }
        }
    }
}

#Preview {
    MyAvailabilityView()
}
