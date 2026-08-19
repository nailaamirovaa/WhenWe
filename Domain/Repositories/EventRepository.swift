//
//  EventRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 30.07.26.
//

protocol EventRepository {
    func createEvent(groupId: String, params: EventParams) async throws -> Event
    func listUpcomingEvents(cursor: String?, limit: Int) async throws -> EventPage
    func getEvent(eventId: String) async throws -> Event
    func updateEvent(eventId: String,params: EventParams) async throws -> Event
    func cancelEvent(eventId: String) async throws -> Event
    func completeEvent(eventId: String) async throws -> Event
    func getPendingAttendance() async throws -> [PendingAttendanceEvent]
}
