//
//  PublicRsvpResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct PublicRsvpResponseDTO: Decodable {

    var rsvp: RsvpResponseDTO?
    var memberToken: String?
    var counts: EventCountsResponseDTO?

    enum CodingKeys: String, CodingKey {
        case rsvp, counts
        case memberToken = "member_token"
    }
}
