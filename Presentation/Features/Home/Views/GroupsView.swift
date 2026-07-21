//
//  GroupsView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct GroupsView: View {

    let groups: [GroupSummary] = GroupSummary.samples
    var onCreateGroup: () -> Void = {}

    var body: some View {

        ZStack(alignment: .bottomTrailing) {

            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.sm) {

                    Text("Groups")
                        .font(AppFont.title1)
                        .foregroundStyle(AppColors.Text.primary)
                        .padding(.bottom, Spacing.xs)

                    ForEach(groups) { group in
                        GroupCard(group: group)
                    }

                    startAnotherGroupCard
                }
                .padding(Spacing.screenPadding)
                .padding(.bottom, Spacing.xxxl * 2)
            }

            FloatingActionButton(action: onCreateGroup)
                .padding(.trailing, Spacing.lg)
                .padding(.bottom, Spacing.lg)
        }
        .background(AppColors.Background.subtle)
    }

    private var startAnotherGroupCard: some View {

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


