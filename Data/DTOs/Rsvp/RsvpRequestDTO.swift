//
//  RsvpRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RsvpRequestDTO: Encodable {

    var response: String?
    var guestCount: Int?

    enum CodingKeys: String, CodingKey {
        case response
        case guestCount = "guest_count"
    }
}
