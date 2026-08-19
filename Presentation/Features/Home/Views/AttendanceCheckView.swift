//
//  AttendanceCheckView.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import SwiftUI

struct AttendanceCheckView: View {

    @Bindable var viewModel: AttendanceCheckViewModel

    var onFinished: () -> Void

    var body: some View {

        VStack(spacing: Spacing.lg) {

            HStack {
                Spacer()

                Button(action: onFinished) {
                    Image(systemName: "xmark")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(AppColors.Text.secondary)
                        .frame(width: 36, height: 36)
                        .background(AppColors.Background.card)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
            }

            Spacer()

            if let event = viewModel.currentEvent {

                VStack(spacing: Spacing.sm) {

                    Text("Did you make it?")
                        .font(AppFont.title1)
                        .foregroundStyle(AppColors.Text.primary)

                    Text(event.title ?? "Your game")
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    if let date = event.startsAtDate {
                        Text(date.formatted(.dateTime.weekday(.wide).month().day()))
                            .font(AppFont.caption)
                            .foregroundStyle(AppColors.Text.secondary)
                    }

                    if let locationName = event.locationName {
                        Text(locationName)
                            .font(AppFont.caption)
                            .foregroundStyle(AppColors.Text.secondary)
                    }
                }
                .multilineTextAlignment(.center)

                VStack(spacing: Spacing.sm) {

                    PrimaryButton(title: "I was there", state: viewModel.isLoading ? .loading : .normal) {
                        Task {
                            await viewModel.respond(attended: true)
                            if viewModel.currentEvent == nil { onFinished() }
                        }
                    }

                    SecondaryButton(title: "I missed it", isEnabled: !viewModel.isLoading) {
                        Task {
                            await viewModel.respond(attended: false)
                            if viewModel.currentEvent == nil { onFinished() }
                        }
                    }
                }
            }

            Spacer()
        }
        .padding(Spacing.screenPadding)
        .background(AppColors.Background.subtle)
    }
}
