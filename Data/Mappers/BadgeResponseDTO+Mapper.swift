//
//  BadgeResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension BadgeResponseDTO {

    func toEntity() throws -> StatsBadge {

        guard let membershipId = membershipId else {
            throw MappingError.missingField("membershipId")
        }

        guard let displayName = displayName else {
            throw MappingError.missingField("displayName")
        }

        return StatsBadge(membershipId: membershipId,
                          displayName: displayName)
    }
}
