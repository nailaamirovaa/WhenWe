//
//  WaitlistRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol WaitlistRepository {
    func getWaitlist(eventId: String) async throws -> [WaitlistEntry]
    func promoteNext(eventId: String) async throws -> [WaitlistEntry]
}
