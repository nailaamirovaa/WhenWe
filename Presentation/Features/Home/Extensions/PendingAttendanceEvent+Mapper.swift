//
//  PendingAttendanceEvent+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

extension PendingAttendanceEvent {

    var startsAtDate: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: startsAt)
    }
}
