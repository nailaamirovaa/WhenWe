//
//  UpcomingEvent.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation

struct UpcomingEvent: Identifiable {

    let id = UUID()
    let emoji: String
    let title: String
    let subtitle: String
    let status: GroupEventStatus
}

struct UpcomingSection: Identifiable {

    let id = UUID()
    let title: String
    let events: [UpcomingEvent]
}

extension UpcomingSection {

    static let samples: [UpcomingSection] = [
        UpcomingSection(
            title: "This week",
            events: [
                UpcomingEvent(emoji: "⚽", title: "Monday Football", subtitle: "Mon 20:00 · 6/10", status: .confirmed),
                UpcomingEvent(emoji: "🃏", title: "Poker night", subtitle: "Fri 21:00 · 4/6", status: .needsMore(2))
            ]
        ),
        UpcomingSection(
            title: "Next week",
            events: [
                UpcomingEvent(emoji: "🎲", title: "Board games", subtitle: "Sat 18:00 · 8/8", status: .waitlist)
            ]
        )
    ]
}
