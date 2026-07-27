//
//  EventDetailResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct EventDetailResponseDTO: Decodable {

    var id: String?
    var groupId: String?
    var title: String?
    var activityType: String?
    var startsAt: String?
    var timeZone: String?
    var durationMin: Int?
    var locationName: String?
    var locationAddress: String?
    var lat: Double?
    var lng: Double?
    var notes: String?
    var capacity: Int?
    var minPlayers: Int?
    var waitlistEnabled: Bool?
    var status: String?
    var recurringSeriesId: String?
    var createdBy: String?
    var shareSlug: String?
    var completedAt: String?
    var cancelledAt: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var counts: EventCountsResponseDTO?
    var rsvps: [RsvpResponseDTO]?
    var shareCard: ShareCardResponseDTO?

    enum CodingKeys: String, CodingKey {
        case id, title, lat, lng, notes, capacity, status, counts, rsvps
        case groupId = "group_id"
        case activityType = "activity_type"
        case startsAt = "starts_at"
        case timeZone = "time_zone"
        case durationMin = "duration_min"
        case locationName = "location_name"
        case locationAddress = "location_address"
        case minPlayers = "min_players"
        case waitlistEnabled = "waitlist_enabled"
        case recurringSeriesId = "recurring_series_id"
        case createdBy = "created_by"
        case shareSlug = "share_slug"
        case completedAt = "completed_at"
        case cancelledAt = "cancelled_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case shareCard = "share_card"
    }
}
