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

        
        if hasCompletedOnboarding {
            HomeTabView()
                .task {
                    do {
                        let repo = SupportRepositoryImplementation(service: SupportService())
                        let articles = try await repo.searchArticles(query: nil)
                        print("Got \(articles.count) articles:", articles)
                    } catch {
                        print("Failed:", error)
                    }
                }
            
        } else {
            OnboardingFlowView(onComplete: { hasCompletedOnboarding = true })
        }
        //HomeTabView()
        
        //LoginView()
    }
}

