//
//  PublicRsvpRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct PublicRsvpRequestDTO: Encodable {

    var name: String?
    var response: String?
    var guestCount: Int?
    var memberToken: String?

    enum CodingKeys: String, CodingKey {
        case name, response
        case guestCount = "guest_count"
        case memberToken = "member_token"
    }
}
