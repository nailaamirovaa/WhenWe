//
//  RecurringSeriesResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RecurringSeriesResponseDTO: Decodable {

    var id: String?
    var groupId: String?
    var rrule: String?
    var weekdays: [Int]?
    var time: String?
    var interval: Int?
    var timeZone: String?
    var template: RecurringTemplateResponseDTO?
    var askOffset: String?
    var active: Bool?
    var nextRunAt: String?
    var createdAt: String?
    var updatedAt: String?
    var previewDates: [String]?

    enum CodingKeys: String, CodingKey {
        case id, rrule, weekdays, time, interval, template, active
        case groupId = "group_id"
        case timeZone = "time_zone"
        case askOffset = "ask_offset"
        case nextRunAt = "next_run_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case previewDates = "preview_dates"
    }
}
