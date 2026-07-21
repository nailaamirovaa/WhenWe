//
//  EventStatusBadge.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct EventStatusBadge: View {

    let status: GroupEventStatus

    var body: some View {

        Text(status.label.uppercased())
            .font(AppFont.label)
            .foregroundStyle(status.tintColor)
            .padding(.horizontal, Spacing.sm)
            .frame(height: 24)
            .background(status.tintColor.opacity(0.12))
            .clipShape(Capsule())
    }
}

#Preview {
    VStack(spacing: Spacing.sm) {
        EventStatusBadge(status: .confirmed)
        EventStatusBadge(status: .needsMore(2))
        EventStatusBadge(status: .waitlist)
    }
    .padding()
}
