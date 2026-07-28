//
//  GroupStatsResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension GroupStatsResponseDTO {

    func toEntity() throws -> GroupStatsSummary {

        guard let period = period else {
            throw MappingError.missingField("period")
        }

        guard let gamesCount = gamesCount else {
            throw MappingError.missingField("gamesCount")
        }

        guard let leaderboard = leaderboard else {
            throw MappingError.missingField("leaderboard")
        }

        guard let streaks = streaks else {
            throw MappingError.missingField("streaks")
        }

        guard let badges = badges else {
            throw MappingError.missingField("badges")
        }

        return GroupStatsSummary(period: period,
                                 gamesCount: gamesCount,
                                 leaderboard: try leaderboard.map { try $0.toEntity() },
                                 streaks: streaks,
                                 badges: try badges.toEntity())
    }
}
