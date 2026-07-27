//
//  UpdateRecurringRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UpdateRecurringRequestDTO: Encodable {

    var rrule: String?
    var weekdays: [Int]?
    var time: String?
    var interval: Int?
    var timeZone: String?
    var template: RecurringTemplateRequestDTO?
    var askOffset: String?

    enum CodingKeys: String, CodingKey {
        case rrule, weekdays, time, interval, template
        case timeZone = "time_zone"
        case askOffset = "ask_offset"
    }
}
