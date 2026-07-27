//
//  ContentView.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct ContentView: View {

    @State private var hasCompletedOnboarding = false

    var body: some View {

        /*
        if hasCompletedOnboarding {
            HomeTabView()
        } else {
            OnboardingFlowView(onComplete: { hasCompletedOnboarding = true })
        }
         */
        //HomeTabView()
        
        LoginView()
    }
}

