//
//  EventCountsResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension EventCountsResponseDTO {

    func toEntity() throws -> EventCounts {

        guard let going = going else {
            throw MappingError.missingField("going")
        }

        guard let maybe = maybe else {
            throw MappingError.missingField("maybe")
        }

        guard let notGoing = notGoing else {
            throw MappingError.missingField("notGoing")
        }

        guard let waiting = waiting else {
            throw MappingError.missingField("waiting")
        }

        return EventCounts(going: going,
                           maybe: maybe,
                           notGoing: notGoing,
                           waiting: waiting)
    }
}
