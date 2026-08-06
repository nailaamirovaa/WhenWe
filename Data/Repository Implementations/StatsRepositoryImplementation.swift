//
//  StatsRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class StatsRepositoryImplementation: StatsRepository {

    private let service: StatsService

    init(service: StatsService) {
        self.service = service
    }

    //MARK: - Get Group Stats
    func getGroupStats(groupId: String, period: String?) async throws -> GroupStatsSummary {
        let dto = try await service.getGroupStats(groupId: groupId, period: period ?? "month")
        return try dto.toEntity()
    }

    //MARK: - Get Shareable Stats
    func getShareableStats(groupId: String) async throws -> ShareableStats {
        let dto = try await service.getStatsCard(groupId: groupId)
        return try dto.toEntity()
    }
}
