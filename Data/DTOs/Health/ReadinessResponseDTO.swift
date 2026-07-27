//
//  ReadinessResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct ReadinessResponseDTO: Decodable {

    var status: String?
    var checks: ReadinessChecksResponseDTO?
}
