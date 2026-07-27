//
//  AvailabilityEntryResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AvailabilityEntryResponseDTO: Decodable {

    var weekday: Int?
    var slot: String?
    var state: String?
}
