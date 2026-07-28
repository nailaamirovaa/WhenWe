//
//  GroupStatsSummary.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct GroupStatsSummary {
    
    let period: String
    let gamesCount: Int
    let leaderboard: [LeaderboardEntry]
    let streaks: [String: Int]
    let badges: StatsBadges
}
