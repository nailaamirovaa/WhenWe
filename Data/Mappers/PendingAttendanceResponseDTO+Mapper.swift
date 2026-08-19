//
//  PendingAttendanceResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

extension PendingAttendanceResponseDTO {

    func toEntity() throws -> PendingAttendanceEvent {

        guard let eventId = eventId else {
            throw MappingError.missingField("eventId")
        }

        guard let startsAt = startsAt else {
            throw MappingError.missingField("startsAt")
        }

        return PendingAttendanceEvent(eventId: eventId,
                                       title: title,
                                       startsAt: startsAt,
                                       locationName: locationName)
    }
}
