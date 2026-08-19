//
//  PendingAttendanceResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

struct PendingAttendanceResponseDTO: Decodable {

    var eventId: String?
    var title: String?
    var startsAt: String?
    var locationName: String?

    enum CodingKeys: String, CodingKey {
        case title
        case eventId = "event_id"
        case startsAt = "starts_at"
        case locationName = "location_name"
    }
}
