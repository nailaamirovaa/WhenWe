//
//  RSVPRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol RSVPRepository {
    func submitRsvp(eventId: String, response: String, guestCount: Int?) async throws -> Rsvp
    func markAttendance(eventId: String, attended: Bool) async throws -> Rsvp
}
