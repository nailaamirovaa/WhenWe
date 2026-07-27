//
//  ClaimMemberRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ClaimMemberRequestDTO: Encodable {

    var memberToken: String?

    enum CodingKeys: String, CodingKey {
        case memberToken = "member_token"
    }
}
