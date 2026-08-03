//
//  EventRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 30.07.26.
//

protocol EventRepository {
    func createEvent(groupId: String,
                     startsAt: String,
                     timeZone: String,
                     title: String?,
                     durationMin: Int?,
                     locationName: String?,
                     locationAddress: String?,
                     lat: Double?,
                     lng: Double?,
                     notes: String?,
                     capacity: Int?,
                     minPlayers: Int?,
                     waitlistEnabled: Bool?) async throws -> Event
    func getUpcomingEvents(cursor: String?, limit: Int) async throws -> EventPage
    func getEvent(eventId: String) async throws -> Event
    func updateEvent(eventId: String,
                     startsAt: String?,
                     timeZone: String?,
                     title: String?,
                     durationMin: Int?,
                     locationName: String?,
                     locationAddress: String?,
                     lat: Double?,
                     lng: Double?,
                     notes: String?,
                     capacity: Int?,
                     minPlayers: Int?,
                     waitlistEnabled: Bool?) async throws -> Event
    func cancelEvent(eventId: String) async throws -> Event
    func completeEvent(eventId: String) async throws -> Event
}
