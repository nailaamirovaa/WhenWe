//
//  MembershipResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension MembershipResponseDTO {

    func toEntity() throws -> Membership {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let groupId = groupId else {
            throw MappingError.missingField("groupId")
        }

        guard let displayName = displayName else {
            throw MappingError.missingField("displayName")
        }

        guard let role = role else {
            throw MappingError.missingField("role")
        }

        guard let status = status else {
            throw MappingError.missingField("status")
        }

        guard let joinedVia = joinedVia else {
            throw MappingError.missingField("joinedVia")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return Membership(id: id,
                          groupId: groupId,
                          displayName: displayName,
                          role: role,
                          status: status,
                          joinedVia: joinedVia,
                          createdAt: createdAt,
                          updatedAt: updatedAt,
                          userId: userId,
                          avatarUrl: avatarUrl,
                          memberTokenId: memberTokenId)
    }
}
