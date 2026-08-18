//
//  Groups.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct Groups: Identifiable {

    let id: String
    let name: String
    let activityType: String
    let emoji: String
    let ownerId: String
    let defaultTimeZone: String
    let inviteCode: String
    let createdAt: String
    let updatedAt: String
    let activityLabel: String?
    let photoUrl: String?
    let archivedAt: String?
    let deletedAt: String?
    let members: [Membership]?
    let nextEvent: Event?
    let upcomingEvents: [Event]?
    let memberCount: Int?
}

extension Groups {
    static var mockBookClub: Groups {
        Groups(
            id: "1",
            name: "Book Club",
            activityType: "reading",
            emoji: "📚",
            ownerId: "user_1",
            defaultTimeZone: "America/New_York",
            inviteCode: "BOOK123",
            createdAt: "2026-01-15T10:00:00Z",
            updatedAt: "2026-08-01T10:00:00Z",
            activityLabel: "Reading",
            photoUrl: nil,
            archivedAt: nil,
            deletedAt: nil,
            members: nil,
            nextEvent: nil,
            upcomingEvents: nil,
            memberCount: 12
        )
    }

    static var mockHiking: Groups {
        Groups(
            id: "2",
            name: "Hiking Group",
            activityType: "outdoors",
            emoji: "🥾",
            ownerId: "user_2",
            defaultTimeZone: "America/Los_Angeles",
            inviteCode: "HIKE456",
            createdAt: "2026-02-20T10:00:00Z",
            updatedAt: "2026-08-05T10:00:00Z",
            activityLabel: "Hiking",
            photoUrl: nil,
            archivedAt: nil,
            deletedAt: nil,
            members: nil,
            nextEvent: nil,
            upcomingEvents: nil,
            memberCount: 8
        )
    }

    static var mockChess: Groups {
        Groups(
            id: "3",
            name: "Chess Club",
            activityType: "games",
            emoji: "♟️",
            ownerId: "user_3",
            defaultTimeZone: "Europe/London",
            inviteCode: "CHESS789",
            createdAt: "2026-03-10T10:00:00Z",
            updatedAt: "2026-07-28T10:00:00Z",
            activityLabel: "Chess",
            photoUrl: nil,
            archivedAt: nil,
            deletedAt: nil,
            members: nil,
            nextEvent: nil,
            upcomingEvents: nil,
            memberCount: 5
        )
    }

    static var mockList: [Groups] {
        [.mockBookClub, .mockHiking, .mockChess]
    }
}
