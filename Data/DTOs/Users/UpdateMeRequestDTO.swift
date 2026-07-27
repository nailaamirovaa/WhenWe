//
//  UpdateMeRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UpdateMeRequestDTO: Encodable {

    var fullName: String?
    var avatarUrl: String?
    var locale: String?
    var timeZone: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case avatarUrl = "avatar_url"
        case locale
        case timeZone = "time_zone"
    }
}
