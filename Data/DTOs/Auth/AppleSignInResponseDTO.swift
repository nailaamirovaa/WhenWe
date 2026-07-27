//
//  AppleSignInResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AppleSignInResponseDTO: Decodable {

    var user: AuthUserDTO?
    var isNew: Bool?
    var tokens: AuthTokensDTO?

    enum CodingKeys: String, CodingKey {
        case user, tokens
        case isNew = "is_new"
    }
}
