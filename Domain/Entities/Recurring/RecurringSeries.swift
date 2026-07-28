//
//  RecurringSeries.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct RecurringSeries: Identifiable {

    let id: String
    let groupId: String
    let timeZone: String
    let template: RecurringTemplate
    let active: Bool
    let createdAt: String
    let updatedAt: String
    let interval: Int
    let rrule: String?
    let weekdays: [Int]
    let time: String?
    let askOffset: String?
    let nextRunAt: String?
    let previewDates: [String]?
}
