//
//  StatsBadge.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct StatsBadge: Identifiable {

    let membershipId: String
    let displayName: String
    var id: String { membershipId }
}
