//
//  EventDetailResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension EventDetailResponseDTO {

    func toEntity() throws -> Event {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let groupId = groupId else {
            throw MappingError.missingField("groupId")
        }

        guard let activityType = activityType else {
            throw MappingError.missingField("activityType")
        }

        guard let startsAt = startsAt else {
            throw MappingError.missingField("startsAt")
        }

        guard let timeZone = timeZone else {
            throw MappingError.missingField("timeZone")
        }

        guard let durationMin = durationMin else {
            throw MappingError.missingField("durationMin")
        }

        guard let waitlistEnabled = waitlistEnabled else {
            throw MappingError.missingField("waitlistEnabled")
        }

        guard let status = status else {
            throw MappingError.missingField("status")
        }

        guard let createdBy = createdBy else {
            throw MappingError.missingField("createdBy")
        }

        guard let shareSlug = shareSlug else {
            throw MappingError.missingField("shareSlug")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return Event(id: id,
                     groupId: groupId,
                     activityType: activityType,
                     startsAt: startsAt,
                     timeZone: timeZone,
                     durationMin: durationMin,
                     waitlistEnabled: waitlistEnabled,
                     status: status,
                     createdBy: createdBy,
                     shareSlug: shareSlug,
                     createdAt: createdAt,
                     updatedAt: updatedAt,
                     title: title,
                     locationName: locationName,
                     locationAddress: locationAddress,
                     lat: lat,
                     lng: lng,
                     notes: notes,
                     capacity: capacity,
                     minPlayers: minPlayers,
                     recurringSeriesId: recurringSeriesId,
                     completedAt: completedAt,
                     cancelledAt: cancelledAt,
                     deletedAt: deletedAt,
                     counts: try counts?.toEntity(),
                     rsvps: try rsvps?.map { try $0.toEntity() })
    }
}
