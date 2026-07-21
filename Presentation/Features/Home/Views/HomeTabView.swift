//
//  HomeTabView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct HomeTabView: View {

    @State private var selectedTab: AppTab = .groups

    var body: some View {
        VStack {

            content

            CustomTabBar(selectedTab: $selectedTab)
                .ignoresSafeArea()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch selectedTab {
        case .groups:
            GroupsView()
        case .upcoming:
            UpcomingView()
        case .profile:
            ProfileView()
        }
    }
}
