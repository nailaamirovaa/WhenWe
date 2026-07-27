//
//  StatsBadgesResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct StatsBadgesResponseDTO: Decodable {

    var mostReliable: BadgeResponseDTO?
    var mostFlaky: BadgeResponseDTO?

    enum CodingKeys: String, CodingKey {
        case mostReliable = "most_reliable"
        case mostFlaky = "most_flaky"
    }
}
