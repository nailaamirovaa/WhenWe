//
//  LeaderboardEntryResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct LeaderboardEntryResponseDTO: Decodable {

    var membershipId: String?
    var displayName: String?
    var gamesAttended: Int?
    var gamesTotal: Int?

    enum CodingKeys: String, CodingKey {
        case membershipId = "membership_id"
        case displayName = "display_name"
        case gamesAttended = "games_attended"
        case gamesTotal = "games_total"
    }
}
