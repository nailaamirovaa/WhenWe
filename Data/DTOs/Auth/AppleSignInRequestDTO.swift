//
//  AppleSignInRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AppleSignInRequestDTO: Encodable {

    var identityToken: String?
    var authorizationCode: String?
    var fullName: String?
    var deviceId: String?
    var platform: String?

    enum CodingKeys: String, CodingKey {
        case identityToken = "identity_token"
        case authorizationCode = "authorization_code"
        case fullName = "full_name"
        case deviceId = "device_id"
        case platform
    }
}
