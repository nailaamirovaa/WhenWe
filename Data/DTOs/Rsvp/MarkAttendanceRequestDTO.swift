//
//  MarkAttendanceRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

struct MarkAttendanceRequestDTO: Encodable {

    var attended: Bool

    enum CodingKeys: String, CodingKey {
        case attended
    }
}
