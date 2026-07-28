//
//  ShareableStatsResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension ShareableStatsResponseDTO {

    func toEntity() throws -> ShareableStats {

        guard let groupName = groupName else {
            throw MappingError.missingField("groupName")
        }

        guard let groupEmoji = groupEmoji else {
            throw MappingError.missingField("groupEmoji")
        }

        guard let gamesCount = gamesCount else {
            throw MappingError.missingField("gamesCount")
        }

        guard let badges = badges else {
            throw MappingError.missingField("badges")
        }

        return ShareableStats(groupName: groupName,
                              groupEmoji: groupEmoji,
                              gamesCount: gamesCount,
                              badges: try badges.toEntity(),
                              topAttendee: try topAttendee?.toEntity())
    }
}
