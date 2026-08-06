//
//  SupportTicketResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension SupportTicketResponseDTO {

    func toEntity() throws -> SupportTicket {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let type = type else {
            throw MappingError.missingField("type")
        }

        guard let subject = subject else {
            throw MappingError.missingField("subject")
        }

        guard let body = body else {
            throw MappingError.missingField("body")
        }

        guard let status = status else {
            throw MappingError.missingField("status")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return SupportTicket(id: id,
                             type: type,
                             subject: subject,
                             body: body,
                             status: status,
                             createdAt: createdAt,
                             updatedAt: updatedAt,
                             userId: userId)
    }
}
