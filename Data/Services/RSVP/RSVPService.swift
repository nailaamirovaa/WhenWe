//
//  RSVPService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class RSVPService {
    
    //MARK: - Submit RSVP
    func submitRSVP(eventId: String, request: RsvpRequestDTO) async throws -> RsvpResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: RSVPRequest.submitRSVP(eventId: eventId, request), responseType: RsvpResponseDTO.self)
    }

    //MARK: - Mark Attendance
    func markAttendance(eventId: String, request: MarkAttendanceRequestDTO) async throws -> RsvpResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: RSVPRequest.markAttendance(eventId: eventId, request), responseType: RsvpResponseDTO.self)
    }
}
