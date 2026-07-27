//
//  UserResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UserResponseDTO: Decodable {

    var id: String?
    var appleUserId: String?
    var googleUserId: String?
    var fullName: String?
    var avatarUrl: String?
    var email: String?
    var locale: String?
    var timeZone: String?
    var isPro: Bool?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var counts: UserCountsResponseDTO?

    enum CodingKeys: String, CodingKey {
        case id, email, locale, counts
        case appleUserId = "apple_user_id"
        case googleUserId = "google_user_id"
        case fullName = "full_name"
        case avatarUrl = "avatar_url"
        case timeZone = "time_zone"
        case isPro = "is_pro"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}
