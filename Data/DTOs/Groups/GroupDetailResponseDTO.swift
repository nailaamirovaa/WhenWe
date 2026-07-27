//
//  GroupDetailResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct GroupDetailResponseDTO: Decodable {

    var id: String?
    var name: String?
    var activityType: String?
    var activityLabel: String?
    var emoji: String?
    var photoUrl: String?
    var ownerId: String?
    var defaultTimeZone: String?
    var inviteCode: String?
    var archivedAt: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var members: [MembershipResponseDTO]?
    var upcomingEvents: [EventResponseDTO]?

    enum CodingKeys: String, CodingKey {
        case id, name, emoji, members
        case activityType = "activity_type"
        case activityLabel = "activity_label"
        case photoUrl = "photo_url"
        case ownerId = "owner_id"
        case defaultTimeZone = "default_time_zone"
        case inviteCode = "invite_code"
        case archivedAt = "archived_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case upcomingEvents = "upcoming_events"
    }
}
