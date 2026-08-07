//
//  OnboardingFlowView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

enum OnboardingStep: Int, CaseIterable {
    case groupSetup
    case firstEvent
    case share
}

struct OnboardingFlowView: View {

    var onComplete: () -> Void = {}
    var onHaveInviteLink: () -> Void = {}

    @State private var viewModel = OnboardingViewModel()
    @State private var showWelcome = true
    @State private var step: OnboardingStep = .groupSetup

    var body: some View {

        Group {

            if showWelcome {

                OnboardingWelcomeView(
                    onCreateGroup: { enterFlow() },
                    onHaveInviteLink: onHaveInviteLink
                )
                .transition(.move(edge: .leading).combined(with: .opacity))

            } else {

                stepsPager.transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }

    private var pageIndex: Int {
        step.rawValue
    }

    private var stepsPager: some View {

        VStack(spacing: 0) {

            header

            GeometryReader { proxy in

                HStack(spacing: 0) {

                    OnboardingGroupSetupView(viewModel: viewModel, onContinue: { goForward() })
                        .frame(width: proxy.size.width)

                    OnboardingFirstEventView(viewModel: viewModel, onContinue: { goForward() })
                        .frame(width: proxy.size.width)

                    OnboardingShareView(viewModel: viewModel, onFinish: onComplete)
                        .frame(width: proxy.size.width)
                }
                .offset(x: -CGFloat(pageIndex) * proxy.size.width)
                .animation(.easeInOut(duration: 0.3), value: pageIndex)
            }
        }
        .background(AppColors.Background.subtle)
    }

    private var header: some View {

        HStack {

            BackButton(action: goBack)

            Spacer()

            ProgressDots(total: OnboardingStep.allCases.count, current: step.rawValue + 1)
                .animation(.easeOut(duration: 0.2), value: step)

            Spacer()

            Color.clear.frame(width: 32, height: 32)
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.top, Spacing.lg)
    }

    private func enterFlow() {

        withAnimation(.easeInOut(duration: 0.3)) {
            showWelcome = false
            step = .groupSetup
        }
    }

    private func goForward() {

        guard let next = OnboardingStep(rawValue: step.rawValue + 1) else { return }
        step = next
    }

    private func goBack() {

        guard let previous = OnboardingStep(rawValue: step.rawValue - 1) else {
            withAnimation(.easeInOut(duration: 0.3)) {
                showWelcome = true
            }
            return
        }

        step = previous
    }
}
