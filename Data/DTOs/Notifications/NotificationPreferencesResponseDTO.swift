//
//  NotificationPreferencesResponseDTO.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct NotificationPreferencesResponseDTO: Decodable {

    var id: String?
    var userId: String?
    var newGamePosted: Bool?
    var rsvpChanges: Bool?
    var gameConfirmed: Bool?
    var dayBeforeNudge: Bool?
    var weeklyRecurringAsk: Bool?
    var attendanceCheck: Bool?
    var quietStart: String?
    var quietEnd: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case newGamePosted = "new_game_posted"
        case rsvpChanges = "rsvp_changes"
        case gameConfirmed = "game_confirmed"
        case dayBeforeNudge = "day_before_nudge"
        case weeklyRecurringAsk = "weekly_recurring_ask"
        case attendanceCheck = "attendance_check"
        case quietStart = "quiet_start"
        case quietEnd = "quiet_end"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
