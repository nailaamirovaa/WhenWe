//
//  UpdatePreferencesRequestDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct UpdatePreferencesRequestDTO: Encodable {

    var newGamePosted: Bool?
    var rsvpChanges: Bool?
    var gameConfirmed: Bool?
    var dayBeforeNudge: Bool?
    var weeklyRecurringAsk: Bool?
    var attendanceCheck: Bool?
    var quietStart: String?
    var quietEnd: String?

    enum CodingKeys: String, CodingKey {
        case newGamePosted = "new_game_posted"
        case rsvpChanges = "rsvp_changes"
        case gameConfirmed = "game_confirmed"
        case dayBeforeNudge = "day_before_nudge"
        case weeklyRecurringAsk = "weekly_recurring_ask"
        case attendanceCheck = "attendance_check"
        case quietStart = "quiet_start"
        case quietEnd = "quiet_end"
    }
}
