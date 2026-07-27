//
//  ReadinessChecksResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ReadinessChecksResponseDTO: Decodable {

    var database: Bool?
    var redis: Bool?
}
