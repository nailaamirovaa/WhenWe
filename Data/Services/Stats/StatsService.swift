//
//  StatsService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class StatsService {
    
    // MARK: - Get Group Stats
    func getGroupStats(groupId: String, period: String) async throws -> GroupStatsResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: StatsRequest.getGroupStats(groupId: groupId, period: period), responseType: GroupStatsResponseDTO.self)
    }

    // MARK: - Get Stats Card
    func getStatsCard(groupId: String) async throws -> ShareableStatsResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: StatsRequest.getStatsCard(groupId: groupId), responseType: ShareableStatsResponseDTO.self)
    }
}
