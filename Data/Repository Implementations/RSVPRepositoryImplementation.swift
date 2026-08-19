//
//  RSVPRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class RSVPRepositoryImplementation: RSVPRepository {

    private let service: RSVPService

    init(service: RSVPService) {
        self.service = service
    }

    //MARK: - Submit RSVP
    func submitRsvp(eventId: String, response: String, guestCount: Int?) async throws -> Rsvp {
        let dto = try await service.submitRSVP(eventId: eventId, request: RsvpRequestDTO(response: response, guestCount: guestCount))
        return try dto.toEntity()
    }

    //MARK: - Mark Attendance
    func markAttendance(eventId: String, attended: Bool) async throws -> Rsvp {
        let dto = try await service.markAttendance(eventId: eventId, request: MarkAttendanceRequestDTO(attended: attended))
        return try dto.toEntity()
    }
}
