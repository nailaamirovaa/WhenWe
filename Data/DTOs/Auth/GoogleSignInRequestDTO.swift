//
//  GoogleSignInRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct GoogleSignInRequestDTO: Encodable {

    var idToken: String?
    var fullName: String?
    var deviceId: String?
    var platform: String?

    enum CodingKeys: String, CodingKey {
        case idToken = "id_token"
        case fullName = "full_name"
        case deviceId = "device_id"
        case platform
    }
}
