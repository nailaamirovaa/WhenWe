//
//  RecurringSchedule.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

enum RecurringSchedule {
    case rrule(String)
    case weekly(weekdays: [Int], time: String)
}
