//
//  RegisterDeviceRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RegisterDeviceRequestDTO: Encodable {

    var apnsToken: String?
    var deviceId: String?
    var environment: String?

    enum CodingKeys: String, CodingKey {
        case apnsToken = "apns_token"
        case deviceId = "device_id"
        case environment
    }
}
