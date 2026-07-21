//
//  UpcomingEventRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct UpcomingEventRow: View {

    let event: UpcomingEvent

    var body: some View {

        HStack(spacing: Spacing.sm) {

            Text(event.emoji)
                .font(.system(size: 28))

            VStack(alignment: .leading, spacing: 2) {

                Text(event.title)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Text.primary)

                Text(event.subtitle)
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            Spacer()

            EventStatusBadge(status: event.status)
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
        .shadow(color: .black.opacity(0.05), radius: 16, y: 6)
    }
}

#Preview {
    UpcomingEventRow(event: UpcomingSection.samples[0].events[0])
        .padding()
}
