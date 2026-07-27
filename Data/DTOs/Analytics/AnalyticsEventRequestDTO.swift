//
//  AnalyticsEventRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AnalyticsEventRequestDTO: Encodable {

    var name: String?
    var props: [String: JSONValue]?
    var clientTs: String?

    enum CodingKeys: String, CodingKey {
        case name, props
        case clientTs = "client_ts"
    }
}
