//
//  GroupsView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct GroupsView: View {

    @State private var viewModel = GroupsViewModel()
    
    let groups: [GroupSummary] = GroupSummary.samples
    @Binding var isTabBarHidden: Bool

    @State private var selectedGroup: GroupSummary?
    @State private var isPresentingCreateEvent = false

    var body: some View {

        NavigationStack {

            ZStack(alignment: .bottomTrailing) {

                ScrollView {

                    VStack(alignment: .leading, spacing: Spacing.sm) {

                        Text("Groups")
                            .font(AppFont.title1)
                            .foregroundStyle(AppColors.Text.primary)
                            .padding(.bottom, Spacing.xs)

                        ForEach((viewModel.groups ?? []).map { $0.toSummary() }) { group in

                            Button {
                                selectedGroup = group
                            } label: {
                                GroupCard(group: group)
                            }
                            .buttonStyle(.plain)
                        }

                        startAnotherGroupCard
                    }
                    .padding(Spacing.screenPadding)
                    .padding(.bottom, Spacing.xxxl * 2)
                }

                FloatingActionButton(action: { isPresentingCreateEvent = true })
                    .padding(.trailing, Spacing.lg)
                    .padding(.bottom, Spacing.lg)
            }
            .background(AppColors.Background.subtle)
            .navigationDestination(item: $selectedGroup) { group in
                EventDetailView(group: group)
            }
            .sheet(isPresented: $isPresentingCreateEvent) {
                CreateEventSheetView()
            }
            .task {
                await viewModel.getGroups()
            }
        }
        .onChange(of: selectedGroup) { _, newValue in
            isTabBarHidden = newValue != nil
        }
    }

    private var startAnotherGroupCard: some View {
        
        Button {
            // create group
        } label: {
            HStack(spacing: Spacing.xs) {

                Text("Start another group")
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Text.secondary)

                Text("PRO")
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Brand.primary)
                    .padding(.horizontal, Spacing.xs)
                    .frame(height: 20)
                    .background(AppColors.Brand.soft)
                    .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity)
            .padding(Spacing.md)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.large)
                    .strokeBorder(AppColors.Text.tertiary, style: StrokeStyle(lineWidth: 1.5, dash: [5]))
            )
        }
    }
}
