//
//  ErrorResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ErrorResponseDTO: Decodable {

    var error: ErrorBodyResponseDTO?
    var requestId: String?

    enum CodingKeys: String, CodingKey {
        case error
        case requestId = "request_id"
    }
}

struct ErrorBodyResponseDTO: Decodable {

    var code: String?
    var message: String?
    var details: [String: JSONValue]?
}
