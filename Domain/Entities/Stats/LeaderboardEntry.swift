//
//  LeaderboardEntry.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct LeaderboardEntry: Identifiable {

    let membershipId: String
    let displayName: String
    let gamesAttended: Int
    let gamesTotal: Int

    var id: String { membershipId }
}
