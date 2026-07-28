//
//  LeaderboardEntryResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension LeaderboardEntryResponseDTO {

    func toEntity() throws -> LeaderboardEntry {

        guard let membershipId = membershipId else {
            throw MappingError.missingField("membershipId")
        }

        guard let displayName = displayName else {
            throw MappingError.missingField("displayName")
        }

        guard let gamesAttended = gamesAttended else {
            throw MappingError.missingField("gamesAttended")
        }

        guard let gamesTotal = gamesTotal else {
            throw MappingError.missingField("gamesTotal")
        }

        return LeaderboardEntry(membershipId: membershipId,
                                displayName: displayName,
                                gamesAttended: gamesAttended,
                                gamesTotal: gamesTotal)
    }
}
