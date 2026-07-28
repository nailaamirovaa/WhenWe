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
}
