//
//  AttendanceCheckViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

@Observable
final class AttendanceCheckViewModel {

    private let rsvpRepository: RSVPRepository

    var events: [PendingAttendanceEvent]
    var isLoading = false
    var error: Error?

    init(events: [PendingAttendanceEvent],
         rsvpRepository: RSVPRepository = RSVPRepositoryImplementation(service: RSVPService())) {
        self.events = events
        self.rsvpRepository = rsvpRepository
    }

    var currentEvent: PendingAttendanceEvent? {
        events.first
    }

    func respond(attended: Bool) async {
        guard let event = currentEvent else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            _ = try await rsvpRepository.markAttendance(eventId: event.eventId, attended: attended)
            events.removeFirst()
        } catch {
            self.error = error
        }
    }
}
