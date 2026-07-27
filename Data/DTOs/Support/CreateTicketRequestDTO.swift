//
//  CreateTicketRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct CreateTicketRequestDTO: Encodable {

    var type: String?
    var subject: String?
    var body: String?
}
