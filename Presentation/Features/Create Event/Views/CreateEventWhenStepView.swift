//
//  CreateEventWhenStepView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct CreateEventWhenStepView: View {

    @Bindable var viewModel: CreateEventViewModel
    let onNext: () -> Void

    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: Spacing.md) {
                
                HStack(alignment: .firstTextBaseline) {
                    
                    Text("What are we playing?")
                        .font(AppFont.title2)
                        .foregroundStyle(AppColors.Text.primary)
                    
                    Spacer()
                    
                    Text("1/2")
                        .font(AppFont.caption.bold())
                        .foregroundStyle(AppColors.Text.tertiary)
                        .monospacedDigit()
                }
                
                activityPicker
                
                customActivityField
                
                Text("When's the game?")
                    .font(AppFont.title2)
                    .foregroundStyle(AppColors.Text.primary)
                    .padding(.top, Spacing.xs)
                
                VStack(spacing: Spacing.xs) {
                    
                    SelectableRow(title: "This Mon 20:00", isSelected: viewModel.useQuickPick) {
                        viewModel.useQuickPick = true
                    }
                    
                    SelectableRow(
                        title: viewModel.useQuickPick ? "Pick from overlap ↓" : viewModel.selectedTimeLabel,
                        isSelected: !viewModel.useQuickPick
                    ) {
                        viewModel.useQuickPick = false
                    }
                }
                
                Text("GROUP AVAILABILITY · DARKER = MORE FREE")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                
                AvailabilityCalendarGrid(
                    selectedDay: Binding(
                        get: { viewModel.selectedDay },
                        set: { viewModel.selectedDay = $0; viewModel.useQuickPick = false }
                    ),
                    selectedHour: Binding(
                        get: { viewModel.selectedHour },
                        set: { viewModel.selectedHour = $0; viewModel.useQuickPick = false }
                    )
                )
                
                Text("WHERE")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
                
                AppTextField(placeholder: "e.g. Neftçi Arena, Field 2", text: $viewModel.eventLocation)
                
                PrimaryButton(title: "Next", action: onNext)
            }
            .padding(.top, Spacing.xxl)
        }
        .presentationDragIndicator(.hidden)
    }

    private var activityPicker: some View {

        HStack(spacing: Spacing.sm) {
            ForEach(EventActivity.allCases) { activity in
                activityPill(activity)
            }
        }
    }

    private func activityPill(_ activity: EventActivity) -> some View {

        let isSelected = viewModel.selectedActivity == activity

        return Button {
            viewModel.selectActivity(activity)
        } label: {
            HStack(spacing: Spacing.xxs) {
                Text(activity.emoji)
                Text(activity.title)
                    .font(AppFont.caption)
            }
            .foregroundStyle(isSelected ? .white : AppColors.Text.primary)
            .padding(.horizontal, Spacing.sm)
            .frame(height: 44)
            .background(isSelected ? AppColors.Brand.primary : AppColors.Background.subtle)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
        }
        .buttonStyle(.plain)
    }

    private var customActivityField: some View {

        HStack(spacing: Spacing.sm) {

            Text("✏️")

            AppTextField(
                placeholder: "Or type your own occasion…",
                text: Binding(
                    get: { viewModel.customActivityName },
                    set: { viewModel.updateCustomActivity($0) }
                )
            )
        }
    }
}
