//
//  HomeTabView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct HomeTabView: View {

    @State private var selectedTab: AppTab = .groups
    @State private var isTabBarHidden = false

    var body: some View {
        ZStack(alignment: .bottom) {

            content
                .ignoresSafeArea(edges: .bottom)

            if !isTabBarHidden {
                CustomTabBar(selectedTab: $selectedTab)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isTabBarHidden)
    }

    @ViewBuilder
    private var content: some View {
        switch selectedTab {
        case .groups:
            GroupsView(isTabBarHidden: $isTabBarHidden)
        case .upcoming:
            UpcomingView()
        case .profile:
            ProfileView()
        }
    }
}
