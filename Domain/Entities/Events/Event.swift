//
//  Event.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct Event: Identifiable {

    let id: String
    let groupId: String
    let activityType: String
    let startsAt: String
    let timeZone: String
    let durationMin: Int?
    let waitlistEnabled: Bool
    let status: String
    let createdBy: String
    let shareSlug: String
    let createdAt: String
    let updatedAt: String
    let title: String?
    let locationName: String?
    let locationAddress: String?
    let lat: Double?
    let lng: Double?
    let notes: String?
    let capacity: Int?
    let minPlayers: Int?
    let recurringSeriesId: String?
    let completedAt: String?
    let cancelledAt: String?
    let deletedAt: String?
    let counts: EventCounts?
    let rsvps: [Rsvp]?
    let shareURL: String?
}
