//
//  UserCountsResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UserCountsResponseDTO: Decodable {

    var ownedGroups: Int?
    var eventsGoing: Int?
    var showUpRate: Int?

    enum CodingKeys: String, CodingKey {
        case ownedGroups = "owned_groups"
        case eventsGoing = "events_going"
        case showUpRate = "show_up_rate"
    }
}
