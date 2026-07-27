//
//  AnalyticsEventResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AnalyticsEventResponseDTO: Decodable {

    var id: String?
    var userId: String?
    var name: String?
    var props: [String: JSONValue]?
    var clientTs: String?
    var serverTs: String?

    enum CodingKeys: String, CodingKey {
        case id, name, props
        case userId = "user_id"
        case clientTs = "client_ts"
        case serverTs = "server_ts"
    }
}
