//
//  UpcomingView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct UpcomingView: View {

    let sections: [UpcomingSection] = UpcomingSection.samples

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: Spacing.md) {

                Text("Upcoming")
                    .font(AppFont.title1)
                    .foregroundStyle(AppColors.Text.primary)

                ForEach(sections) { section in

                    VStack(alignment: .leading, spacing: Spacing.sm) {

                        Text(section.title.uppercased())
                            .font(AppFont.label)
                            .foregroundStyle(AppColors.Text.tertiary)

                        ForEach(section.events) { event in
                            UpcomingEventRow(event: event)
                        }
                    }
                }
            }
            .padding(Spacing.screenPadding)
        }
        .background(AppColors.Background.subtle)
    }
}
