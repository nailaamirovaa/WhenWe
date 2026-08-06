//
//  SupportService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class SupportService {
    
    // MARK: - Get Help Articles
    func getHelpArticles(waitlist: String) async throws -> [SupportArticleResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: SupportRequest.helpArticles(waitlist: waitlist), responseType: [SupportArticleResponseDTO].self)
    }

    // MARK: - Create Support Ticket
    func createSupportTicket(request: CreateTicketRequestDTO) async throws -> SupportTicketResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: SupportRequest.createSupportTicket(request), responseType: SupportTicketResponseDTO.self)
    }
    
    // MARK: - Create Feature Suggestion
    func createFeatureSuggestion(request: CreateFeatureSuggestionRequestDTO) async throws -> FeatureSuggestionResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: SupportRequest.createFeatureSuggestion(request), responseType: FeatureSuggestionResponseDTO.self)
    }
}
