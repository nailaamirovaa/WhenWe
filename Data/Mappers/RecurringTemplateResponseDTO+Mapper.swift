//
//  RecurringTemplateResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension RecurringTemplateResponseDTO {

    func toEntity() -> RecurringTemplate {

        return RecurringTemplate(title: title,
                                 durationMin: durationMin,
                                 locationName: locationName,
                                 locationAddress: locationAddress,
                                 capacity: capacity,
                                 minPlayers: minPlayers,
                                 waitlistEnabled: waitlistEnabled)
    }
}
