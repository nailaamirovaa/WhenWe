//
//  InviteLinkResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct InviteLinkResponseDTO: Decodable {

    var inviteCode: String?
    var inviteUrl: String?

    enum CodingKeys: String, CodingKey {
        case inviteCode = "invite_code"
        case inviteUrl = "invite_url"
    }
}
