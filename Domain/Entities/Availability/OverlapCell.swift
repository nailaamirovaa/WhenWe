//
//  OverlapCell.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct OverlapCell: Identifiable {
    
    let weekday: Int
    let slot: String
    let freeCount: Int
    let maybeCount: Int
    let freeMembers: [String]
    let maybeMembers: [String]
    var id: String { "\(weekday)-\(slot)" }
}
