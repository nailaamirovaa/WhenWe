//
//  EventRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class EventRepositoryImplementation: EventRepository {
        
    private let service: EventsService
    
    init(service: EventsService) {
        self.service = service
    }
    
    //MARK: - Create Event
    func createEvent(groupId: String, params: EventParams) async throws -> Event {
        let dto = try await service.createEvent(groupId: groupId, request: CreateEventRequestDTO(
            title: params.title,
            startsAt: params.startsAt,
            timeZone: params.timeZone,
            durationMin: params.durationMin,
            locationName: params.locationName,
            locationAddress: params.locationAddress,
            lat: params.lat,
            lng: params.lng,
            notes: params.notes,
            capacity: params.capacity,
            minPlayers: params.minPlayers,
            waitlistEnabled: params.waitlistEnabled
        ))
        
        return try dto.toEntity()
    }
    
    //MARK: - Update Event
    func updateEvent(eventId: String, params: EventParams) async throws -> Event {
        let dto = try await service.updateEvent(eventId: eventId, request: UpdateEventRequestDTO(
            title: params.title,
            startsAt: params.startsAt,
            timeZone: params.timeZone,
            durationMin: params.durationMin,
            locationName: params.locationName,
            locationAddress: params.locationAddress,
            lat: params.lat,
            lng: params.lng,
            notes: params.notes,
            capacity: params.capacity,
            minPlayers: params.minPlayers,
            waitlistEnabled: params.waitlistEnabled
        ))
        
        return try dto.toEntity()
    }
    
    //MARK: - List Upcoming Events
    func listUpcomingEvents(cursor: String?, limit: Int) async throws -> EventPage {
        let dto = try await service.listUpcomingEvents(cursor: cursor, limit: limit)

        guard let data = dto.data else {
            throw MappingError.missingField("data")
        }

        let events = try data.map { try $0.toEntity() }
        return EventPage(events: events, nextCursor: dto.nextCursor)
    }
    
    //MARK: - Get Event
    func getEvent(eventId: String) async throws -> Event {
        let dto = try await service.getEvent(eventId: eventId)
        
        return try dto.toEntity()
    }
    
    //MARK: - Cancel Event
    func cancelEvent(eventId: String) async throws -> Event {
        let dto = try await service.cancelEvent(eventId: eventId)
        
        return try dto.toEntity()
    }
    
    //MARK: - Complete Event
    func completeEvent(eventId: String) async throws -> Event {
        let dto = try await service.completeEvent(eventId: eventId)

        return try dto.toEntity()
    }

    //MARK: - Get Pending Attendance
    func getPendingAttendance() async throws -> [PendingAttendanceEvent] {
        let dtos = try await service.getPendingAttendance()
        return try dtos.map { try $0.toEntity() }
    }
}
