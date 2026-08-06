//
//  SupportRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class SupportRepositoryImplementation: SupportRepository {

    private let service: SupportService

    init(service: SupportService) {
        self.service = service
    }

    //MARK: - Search Articles
    func searchArticles(query: String?) async throws -> [SupportArticle] {
        let dtos = try await service.getHelpArticles(waitlist: query ?? "")
        return try dtos.map { try $0.toEntity() }
    }

    //MARK: - Create Ticket
    func createTicket(type: String, subject: String, body: String) async throws -> SupportTicket {
        let dto = try await service.createSupportTicket(request: CreateTicketRequestDTO(type: type, subject: subject, body: body))
        return try dto.toEntity()
    }

    //MARK: - Create Feature Suggestion
    func createFeatureSuggestion(subject: String, body: String) async throws -> FeatureSuggestion {
        let dto = try await service.createFeatureSuggestion(request: CreateFeatureSuggestionRequestDTO(subject: subject, body: body))
        return try dto.toEntity()
    }
}
