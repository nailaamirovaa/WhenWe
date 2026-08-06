//
//  WaitlistService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class WaitlistService {
    
    // MARK: - Get Waitlist
    func getWaitliat(eventId: String) async throws -> [WaitlistEntryResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: WaitlistRequest.getWaitlist(eventId: eventId), responseType: [WaitlistEntryResponseDTO].self)
    }

    // MARK: - Get Waitlist
    func promoteNextWaiting(eventId: String) async throws -> [WaitlistEntryResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: WaitlistRequest.promotenextWaiting(eventId: eventId), responseType: [WaitlistEntryResponseDTO].self)
    }
}
