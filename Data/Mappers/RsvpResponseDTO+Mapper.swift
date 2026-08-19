//
//  RsvpResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension RsvpResponseDTO {

    func toEntity() throws -> Rsvp {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let eventId = eventId else {
            throw MappingError.missingField("eventId")
        }

        guard let membershipId = membershipId else {
            throw MappingError.missingField("membershipId")
        }

        guard let response = response else {
            throw MappingError.missingField("response")
        }

        guard let respondedAt = respondedAt else {
            throw MappingError.missingField("respondedAt")
        }

        guard let source = source else {
            throw MappingError.missingField("source")
        }

        guard let guestCount = guestCount else {
            throw MappingError.missingField("guestCount")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return Rsvp(id: id,
                    eventId: eventId,
                    membershipId: membershipId,
                    response: response,
                    respondedAt: respondedAt,
                    source: source,
                    guestCount: guestCount,
                    createdAt: createdAt,
                    updatedAt: updatedAt,
                    membershipUserId: membership?.userId,
                    membershipDisplayName: membership?.displayName,
                    attended: attended)
    }
}
