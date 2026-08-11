//
//  EventTimeOption.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation

enum EventTimeOption: Equatable {
    case nextMonday
    case nextFriday
    case custom(Date)

    static func == (lhs: EventTimeOption, rhs: EventTimeOption) -> Bool {
        switch (lhs, rhs) {
        case (.nextMonday, .nextMonday), (.nextFriday, .nextFriday):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }

    var title: String {
        switch self {
        case .nextMonday: return "Next Monday · 20:00"
        case .nextFriday: return "Next Friday · 21:00"
        case .custom(let date): return date.formatted(date: .abbreviated, time: .shortened)
        }
    }
    
    var date: Date {
        switch self {
        case .nextMonday: return Self.next(.monday, hour: 20)
        case .nextFriday: return Self.next(.friday, hour: 21)
        case .custom(let date): return date
        }
    }

    private static func next(_ weekday: Weekday, hour: Int) -> Date {
        let calendar = Calendar.current
        let today = Date()
        let todayWeekday = calendar.component(.weekday, from: today)

        var delta = weekday.rawValue - todayWeekday
        if delta <= 0 { delta += 7 }

        let day = calendar.date(byAdding: .day, value: delta, to: today) ?? today
        return calendar.date(bySettingHour: hour, minute: 0, second: 0, of: day) ?? day
    }

    private enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
}
