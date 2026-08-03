//
//  StatsRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol StatsRepository {
    func getGroupStats(groupId: String, period: String?) async throws -> GroupStatsSummary
    func getShareableStats(groupId: String) async throws -> ShareableStats
}
