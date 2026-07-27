//
//  JoinPreviewResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct JoinPreviewResponseDTO: Decodable {

    var id: String?
    var name: String?
    var emoji: String?
    var activityType: String?
    var memberCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, emoji
        case activityType = "activity_type"
        case memberCount = "member_count"
    }
}
