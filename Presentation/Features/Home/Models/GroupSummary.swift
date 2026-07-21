//
//  GroupSummary.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation

struct GroupSummary: Identifiable {

    let id = UUID()
    let emoji: String
    let name: String
    let memberCount: Int
    let activityName: String
    let nextEvent: NextEventSummary
}

struct NextEventSummary {

    let dayTime: String
    let going: Int
    let total: Int
    let location: String
    let status: GroupEventStatus

    var progress: Double {
        total > 0 ? Double(going) / Double(total) : 0
    }
}

extension GroupSummary {

    static let samples: [GroupSummary] = [
        GroupSummary(
            emoji: "⚽",
            name: "Monday Legends",
            memberCount: 8,
            activityName: "football",
            nextEvent: NextEventSummary(
                dayTime: "Mon 20:00",
                going: 6,
                total: 10,
                location: "Neftçi Arena",
                status: .confirmed
            )
        ),
        GroupSummary(
            emoji: "🃏",
            name: "Poker Fridays",
            memberCount: 6,
            activityName: "poker",
            nextEvent: NextEventSummary(
                dayTime: "Fri 21:00",
                going: 4,
                total: 6,
                location: "Elvin's place",
                status: .needsMore(2)
            )
        )
    ]
}
