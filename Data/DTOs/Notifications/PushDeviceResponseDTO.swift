//
//  PushDeviceResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct PushDeviceResponseDTO: Decodable {

    var id: String?
    var userId: String?
    var apnsToken: String?
    var bundleEnv: String?
    var deviceId: String?
    var lastSeenAt: String?
    var active: Bool?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, active
        case userId = "user_id"
        case apnsToken = "apns_token"
        case bundleEnv = "bundle_env"
        case deviceId = "device_id"
        case lastSeenAt = "last_seen_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
