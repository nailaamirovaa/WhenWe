//
//  GroupCard.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct GroupCard: View {

    let group: GroupSummary

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.sm) {

            HStack(spacing: Spacing.sm) {

                Text(group.emoji)
                    .font(.system(size: 24))
                    .frame(width: 48, height: 48)
                    .background(AppColors.Brand.soft)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))

                VStack(alignment: .leading, spacing: 2) {

                    Text(group.name)
                        .font(AppFont.title2)
                        .foregroundStyle(AppColors.Text.primary)

                    Text("\(group.memberCount) members · \(group.activityName)")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }

                Spacer()
            }

            HStack(spacing: Spacing.sm) {

                CircularProgressRing(progress: group.nextEvent?.progress ?? 0, color: group.nextEvent?.status.ringColor ?? .clear)
                    .frame(width: 34, height: 34)

                VStack(alignment: .leading, spacing: 2) {

                    if let event = group.nextEvent {
                        Text("\(event.dayTime?.formatted(.dateTime.weekday(.abbreviated).hour().minute()) ?? "") · \(event.going)/\(event.total) going")
                            .font(AppFont.label)
                            .foregroundStyle(AppColors.Text.primary)
                    } else {
                        Text("No upcoming event")
                            .font(AppFont.label)
                            .foregroundStyle(AppColors.Text.primary)
                    }

                    Text(group.nextEvent?.location ?? "")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                }

                Spacer()

                EventStatusBadge(status: group.nextEvent?.status ?? .needsMore(group.memberCount))
            }
            .padding(Spacing.sm)
            .background(AppColors.Background.subtle)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
        .shadow(color: .black.opacity(0.05), radius: 16, y: 6)
    }
}


