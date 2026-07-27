//
//  WaitlistEntryResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct WaitlistEntryResponseDTO: Decodable {

    var id: String?
    var eventId: String?
    var membershipId: String?
    var position: Int?
    var state: String?
    var promotedAt: String?
    var createdAt: String?
    var updatedAt: String?
    var membership: MembershipResponseDTO?

    enum CodingKeys: String, CodingKey {
        case id, position, state, membership
        case eventId = "event_id"
        case membershipId = "membership_id"
        case promotedAt = "promoted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
