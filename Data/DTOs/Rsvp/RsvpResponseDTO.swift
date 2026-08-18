//
//  RsvpResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RsvpResponseDTO: Decodable {

    var id: String?
    var eventId: String?
    var membershipId: String?
    var response: String?
    var respondedAt: String?
    var source: String?
    var guestCount: Int?
    var createdAt: String?
    var updatedAt: String?
    var membership: MembershipResponseDTO?

    enum CodingKeys: String, CodingKey {
        case id, response, source, membership
        case eventId = "event_id"
        case membershipId = "membership_id"
        case respondedAt = "responded_at"
        case guestCount = "guest_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
