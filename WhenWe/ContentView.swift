//
//  ContentView.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct ContentView: View {

    @State private var hasCompletedOnboarding = false
    @State private var router = AppRouter()

    var body: some View {
        
        Group {
            switch router.route {
            case .launching:
                LoginView(onSignedIn: router.signedIn)
            case .signIn:
                LoginView(onSignedIn: router.signedIn)
            case .nameSetup:
                NameSetupView()
            case .homeTab:
                HomeTabView()
            case .onboarding:
                OnboardingFlowView(onComplete: router.completedOnboarding)
            }
        }
        .task {
            await router.start()
        }
        .environment(router)
    }
}

