//
//  PublicEventResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct PublicEventResponseDTO: Decodable {

    var id: String?
    var title: String?
    var activityType: String?
    var startsAt: String?
    var timeZone: String?
    var durationMin: Int?
    var locationName: String?
    var locationAddress: String?
    var status: String?
    var capacity: Int?
    var counts: EventCountsResponseDTO?
    var group: PublicGroupSummaryResponseDTO?
    var shareCard: ShareCardResponseDTO?
    var realtimeToken: String?

    enum CodingKeys: String, CodingKey {
        case id, title, status, capacity, counts, group
        case activityType = "activity_type"
        case startsAt = "starts_at"
        case timeZone = "time_zone"
        case durationMin = "duration_min"
        case locationName = "location_name"
        case locationAddress = "location_address"
        case shareCard = "share_card"
        case realtimeToken = "realtime_token"
    }
}
