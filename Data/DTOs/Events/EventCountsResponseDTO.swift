//
//  EventCountsResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct EventCountsResponseDTO: Decodable {

    var going: Int?
    var maybe: Int?
    var notGoing: Int?
    var waiting: Int?

    enum CodingKeys: String, CodingKey {
        case going, maybe, waiting
        case notGoing = "not_going"
    }
}
