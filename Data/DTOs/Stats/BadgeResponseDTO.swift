//
//  BadgeResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct BadgeResponseDTO: Decodable {

    var membershipId: String?
    var displayName: String?

    enum CodingKeys: String, CodingKey {
        case membershipId = "membership_id"
        case displayName = "display_name"
    }
}
