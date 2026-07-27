//
//  CreateEventRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct CreateEventRequestDTO: Encodable {

    var title: String?
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

    enum CodingKeys: String, CodingKey {
        case title, lat, lng, notes, capacity
        case startsAt = "starts_at"
        case timeZone = "time_zone"
        case durationMin = "duration_min"
        case locationName = "location_name"
        case locationAddress = "location_address"
        case minPlayers = "min_players"
        case waitlistEnabled = "waitlist_enabled"
    }
}
