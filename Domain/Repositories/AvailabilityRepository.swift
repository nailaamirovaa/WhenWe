//
//  AvailabilityRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol AvailabilityRepository {
    func getMyAvailability() async throws -> [AvailabilityEntry]
    func updateMyAvailability(entries: [AvailabilityEntryRequestDTO]) async throws -> [AvailabilityEntry]
    func getGroupOverlapHeatmap(groupId: String) async throws -> [OverlapCell]
}
