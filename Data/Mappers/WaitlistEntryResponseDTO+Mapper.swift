//
//  WaitlistEntryResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension WaitlistEntryResponseDTO {

    func toEntity() throws -> WaitlistEntry {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let eventId = eventId else {
            throw MappingError.missingField("eventId")
        }

        guard let membershipId = membershipId else {
            throw MappingError.missingField("membershipId")
        }

        guard let position = position else {
            throw MappingError.missingField("position")
        }

        guard let state = state else {
            throw MappingError.missingField("state")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return WaitlistEntry(id: id,
                             eventId: eventId,
                             membershipId: membershipId,
                             position: position,
                             state: state,
                             createdAt: createdAt,
                             updatedAt: updatedAt,
                             promotedAt: promotedAt,
                             membership: try membership?.toEntity())
    }
}
