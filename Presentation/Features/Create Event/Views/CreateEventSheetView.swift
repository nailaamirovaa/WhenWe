//
//  CreateEventSheetView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct CreateEventSheetView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = CreateEventViewModel()
    @State private var step = 1
    @State private var isMovingForward = true

    var body: some View {

        Group {

            if step == 1 {
                CreateEventWhenStepView(viewModel: viewModel, onNext: goToOptions)
                    .transition(transition)
            } else {
                CreateEventOptionsStepView(viewModel: viewModel, onBack: goToWhen, onCreate: { dismiss() })
                    .transition(transition)
            }
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.top, Spacing.sm)
        .padding(.bottom, Spacing.sm)
        .presentationDetents([.height(step == 1 ? 700 : 620)])
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(Radius.extraLarge)
        .presentationBackground(.white)
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        
    }

    private var transition: AnyTransition {
        isMovingForward
            ? .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
            : .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
    }

    private func goToOptions() {
        isMovingForward = true
        withAnimation(.easeInOut(duration: 0.3)) {
            step = 2
        }
    }

    private func goToWhen() {
        isMovingForward = false
        withAnimation(.easeInOut(duration: 0.3)) {
            step = 1
        }
    }
}
