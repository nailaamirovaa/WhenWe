//
//  InstallIntentRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct InstallIntentRequestDTO: Encodable {

    var memberToken: String?
    var source: String?

    enum CodingKeys: String, CodingKey {
        case memberToken = "member_token"
        case source
    }
}
