//
//  WidgetNextResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct WidgetNextResponseDTO: Decodable {

    var hasEvent: Bool?
    var eventId: String?
    var groupEmoji: String?
    var activityType: String?
    var title: String?
    var startsAt: String?
    var timeZone: String?
    var going: Int?
    var capacity: Int?
    var confirmed: Bool?
    var goingAvatars: [WidgetAvatarResponseDTO]?

    enum CodingKeys: String, CodingKey {
        case title, going, capacity, confirmed
        case hasEvent = "has_event"
        case eventId = "event_id"
        case groupEmoji = "group_emoji"
        case activityType = "activity_type"
        case startsAt = "starts_at"
        case timeZone = "time_zone"
        case goingAvatars = "going_avatars"
    }
}
