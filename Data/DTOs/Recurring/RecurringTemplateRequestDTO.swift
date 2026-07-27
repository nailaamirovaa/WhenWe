//
//  RecurringTemplateRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RecurringTemplateRequestDTO: Encodable {

    var title: String?
    var durationMin: Int?
    var locationName: String?
    var locationAddress: String?
    var capacity: Int?
    var minPlayers: Int?
    var waitlistEnabled: Bool?

    enum CodingKeys: String, CodingKey {
        case title, capacity
        case durationMin = "duration_min"
        case locationName = "location_name"
        case locationAddress = "location_address"
        case minPlayers = "min_players"
        case waitlistEnabled = "waitlist_enabled"
    }
}
