//
//  OverlapCellResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct OverlapCellResponseDTO: Decodable {

    var weekday: Int?
    var slot: String?
    var freeCount: Int?
    var maybeCount: Int?
    var freeMembers: [String]?
    var maybeMembers: [String]?

    enum CodingKeys: String, CodingKey {
        case weekday, slot
        case freeCount = "free_count"
        case maybeCount = "maybe_count"
        case freeMembers = "free_members"
        case maybeMembers = "maybe_members"
    }
}
