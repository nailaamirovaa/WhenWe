//
//  SupportTicketResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct SupportTicketResponseDTO: Decodable {

    var id: String?
    var userId: String?
    var type: String?
    var subject: String?
    var body: String?
    var status: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, type, subject, body, status
        case userId = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
