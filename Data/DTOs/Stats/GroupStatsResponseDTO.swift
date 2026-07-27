//
//  GroupStatsResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct GroupStatsResponseDTO: Decodable {

    var period: String?
    var gamesCount: Int?
    var leaderboard: [LeaderboardEntryResponseDTO]?
    var streaks: [String: Int]?
    var badges: StatsBadgesResponseDTO?

    enum CodingKeys: String, CodingKey {
        case period, leaderboard, streaks, badges
        case gamesCount = "games_count"
    }
}
