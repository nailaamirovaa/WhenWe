//
//  UpdateGroupRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UpdateGroupRequestDTO: Encodable {

    var name: String?
    var emoji: String?
    var photoUrl: String?
    var archived: Bool?

    enum CodingKeys: String, CodingKey {
        case name, emoji, archived
        case photoUrl = "photo_url"
    }
}
