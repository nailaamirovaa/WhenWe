//
//  CreateGroupRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct CreateGroupRequestDTO: Encodable {

    var name: String?
    var activityType: String?
    var activityLabel: String?
    var emoji: String?

    enum CodingKeys: String, CodingKey {
        case name, emoji
        case activityType = "activity_type"
        case activityLabel = "activity_label"
    }
}
