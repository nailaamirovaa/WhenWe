//
//  NotificationPreferences.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

import Foundation

struct NotificationPreferences: Identifiable {

    let id: String
    let userId: String
    let newGamePosted: Bool
    let rsvpChanges: Bool
    let gameConfirmed: Bool
    let dayBeforeNudge: Bool
    let weeklyRecurringAsk: Bool
    let attendanceCheck: Bool
    let quietStart: String
    let quietEnd: String
    let createdAt: String
    let updatedAt: String
}
