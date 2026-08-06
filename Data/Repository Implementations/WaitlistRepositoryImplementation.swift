//
//  WaitlistRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class WaitlistRepositoryImplementation: WaitlistRepository {

    private let service: WaitlistService

    init(service: WaitlistService) {
        self.service = service
    }

    //MARK: - Get Waitlist
    func getWaitlist(eventId: String) async throws -> [WaitlistEntry] {
        let dtos = try await service.getWaitliat(eventId: eventId)
        return try dtos.map { try $0.toEntity() }
    }

    //MARK: - Promote Next
    func promoteNext(eventId: String) async throws -> [WaitlistEntry] {
        let dtos = try await service.promoteNextWaiting(eventId: eventId)
        return try dtos.map { try $0.toEntity() }
    }
}
