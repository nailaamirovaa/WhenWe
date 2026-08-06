//
//  EventListResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension EventListResponseDTO {

    func toEntity() throws -> EventPage {

        guard let data = data else {
            throw MappingError.missingField("data")
        }

        return EventPage(events: try data.map { try $0.toEntity() },
                         nextCursor: nextCursor)
    }
}
