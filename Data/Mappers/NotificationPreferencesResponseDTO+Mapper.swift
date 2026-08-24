//
//  NotificationPreferencesResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension NotificationPreferencesResponseDTO {

    func toEntity() throws -> NotificationPreferences {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let userId = userId else {
            throw MappingError.missingField("userId")
        }

        guard let newGamePosted = newGamePosted else {
            throw MappingError.missingField("newGamePosted")
        }

        guard let rsvpChanges = rsvpChanges else {
            throw MappingError.missingField("rsvpChanges")
        }

        guard let gameConfirmed = gameConfirmed else {
            throw MappingError.missingField("gameConfirmed")
        }

        guard let dayBeforeNudge = dayBeforeNudge else {
            throw MappingError.missingField("dayBeforeNudge")
        }

        guard let weeklyRecurringAsk = weeklyRecurringAsk else {
            throw MappingError.missingField("weeklyRecurringAsk")
        }

        guard let attendanceCheck = attendanceCheck else {
            throw MappingError.missingField("attendanceCheck")
        }

        guard let quietStart = quietStart else {
            throw MappingError.missingField("quietStart")
        }

        guard let quietEnd = quietEnd else {
            throw MappingError.missingField("quietEnd")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return NotificationPreferences(id: id,
                                       userId: userId,
                                       newGamePosted: newGamePosted,
                                       rsvpChanges: rsvpChanges,
                                       gameConfirmed: gameConfirmed,
                                       dayBeforeNudge: dayBeforeNudge,
                                       weeklyRecurringAsk: weeklyRecurringAsk,
                                       attendanceCheck: attendanceCheck,
                                       quietStart: quietStart,
                                       quietEnd: quietEnd,
                                       createdAt: createdAt,
                                       updatedAt: updatedAt)
    }
}
