//
//  ShareableStatsResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ShareableStatsResponseDTO: Decodable {

    var groupName: String?
    var groupEmoji: String?
    var gamesCount: Int?
    var topAttendee: LeaderboardEntryResponseDTO?
    var badges: StatsBadgesResponseDTO?

    enum CodingKeys: String, CodingKey {
        case groupName = "group_name"
        case groupEmoji = "group_emoji"
        case gamesCount = "games_count"
        case topAttendee = "top_attendee"
        case badges
    }
}
