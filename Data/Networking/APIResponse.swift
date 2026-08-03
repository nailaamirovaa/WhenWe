//
//  APIResponse.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

struct APIResponse<T: Decodable>: Decodable {
    let data: T?
}

struct APIError: Decodable {

    var error: APIErrorBody?
    var requestId: String?

    enum CodingKeys: String, CodingKey {
        case error
        case requestId = "request_id"
    }
}

struct APIErrorBody: Decodable {

    var code: String?
    var message: String?
    var details: [String: JSONValue]?
}
