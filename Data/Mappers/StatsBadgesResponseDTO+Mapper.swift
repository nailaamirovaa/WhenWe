//
//  StatsBadgesResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension StatsBadgesResponseDTO {

    func toEntity() throws -> StatsBadges {

        return StatsBadges(mostReliable: try mostReliable?.toEntity(),
                           mostFlaky: try mostFlaky?.toEntity())
    }
}
