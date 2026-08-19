//
//  PendingAttendanceEvent.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

struct PendingAttendanceEvent: Identifiable {

    let eventId: String
    let title: String?
    let startsAt: String
    let locationName: String?

    var id: String { eventId }
}
