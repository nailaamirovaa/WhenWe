//
//  GroupDetailResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension GroupDetailResponseDTO {

    func toEntity() throws -> Groups {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let name = name else {
            throw MappingError.missingField("name")
        }

        guard let activityType = activityType else {
            throw MappingError.missingField("activityType")
        }

        guard let emoji = emoji else {
            throw MappingError.missingField("emoji")
        }

        guard let ownerId = ownerId else {
            throw MappingError.missingField("ownerId")
        }

        guard let defaultTimeZone = defaultTimeZone else {
            throw MappingError.missingField("defaultTimeZone")
        }

        guard let inviteCode = inviteCode else {
            throw MappingError.missingField("inviteCode")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return Groups(id: id,
                      name: name,
                      activityType: activityType,
                      emoji: emoji,
                      ownerId: ownerId,
                      defaultTimeZone: defaultTimeZone,
                      inviteCode: inviteCode,
                      createdAt: createdAt,
                      updatedAt: updatedAt,
                      activityLabel: activityLabel,
                      photoUrl: photoUrl,
                      archivedAt: archivedAt,
                      deletedAt: deletedAt,
                      members: try members?.map { try $0.toEntity() },
                      nextEvent: nil,
                      upcomingEvents: try upcomingEvents?.map { try $0.toEntity() })
    }
}
