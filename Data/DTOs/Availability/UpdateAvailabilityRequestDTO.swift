//
//  UpdateAvailabilityRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UpdateAvailabilityRequestDTO: Encodable {

    var entries: [AvailabilityEntryRequestDTO]?
}
