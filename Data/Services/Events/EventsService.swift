//
//  EventsService.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

final class EventsService {
    
    //MARK: - Create Event
    func createEvent(groupId: String, request: CreateEventRequestDTO) async throws -> EventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.createEvent(groupId: groupId, request: request),
                                                       responseType: EventResponseDTO.self)
    }
    
    //MARK: - List Upcoming Events
    func listUpcomingEvents(cursor: String?, limit: Int) async throws -> EventListResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.listUpcomingEvents(cursor: cursor, limit: limit),
                                                       responseType: EventListResponseDTO.self)
    }
    
    //MARK: - Get Event
    func getEvent(eventId: String) async throws -> EventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.getEvent(eventId: eventId),
                                                       responseType: EventResponseDTO.self)
    }
    
    //MARK: - Update Event
    func updateEvent(eventId: String, request: UpdateEventRequestDTO) async throws -> EventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.updateEvent(eventId: eventId, request),
                                                       responseType: EventResponseDTO.self)
    }
    
    //MARK: - Cancel Event
    func cancelEvent(eventId: String) async throws -> EventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.cancelEvent(eventId: eventId),
                                                       responseType: EventResponseDTO.self)
    }
    
    //MARK: - Complete Event
    func completeEvent(eventId: String) async throws -> EventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.completeEvent(eventId: eventId),
                                                       responseType: EventResponseDTO.self)
    }

    //MARK: - Get Pending Attendance
    func getPendingAttendance() async throws -> [PendingAttendanceResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: EventsRequest.getPendingAttendance,
                                                       responseType: [PendingAttendanceResponseDTO].self)
    }
}
