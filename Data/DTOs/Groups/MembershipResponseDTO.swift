//
//  MembershipResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct MembershipResponseDTO: Decodable {

    var id: String?
    var groupId: String?
    var userId: String?
    var displayName: String?
    var role: String?
    var status: String?
    var joinedVia: String?
    var avatarUrl: String?
    var memberTokenId: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, role, status
        case groupId = "group_id"
        case userId = "user_id"
        case displayName = "display_name"
        case joinedVia = "joined_via"
        case avatarUrl = "avatar_url"
        case memberTokenId = "member_token_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
