//
//  UserCountsResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension UserCountsResponseDTO {

    func toEntity() throws -> UserCounts {

        guard let ownedGroups = ownedGroups else {
            throw MappingError.missingField("ownedGroups")
        }

        guard let eventsGoing = eventsGoing else {
            throw MappingError.missingField("eventsGoing")
        }

        return UserCounts(ownedGroups: ownedGroups,
                          eventsGoing: eventsGoing,
                          showUpRate: showUpRate)
    }
}
