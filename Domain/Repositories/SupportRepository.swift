//
//  SupportRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol SupportRepository {
    func searchArticles(query: String?) async throws -> [SupportArticle]
    func createTicket(type: String, subject: String, body: String) async throws -> SupportTicket
    func createFeatureSuggestion(subject: String, body: String) async throws -> FeatureSuggestion
}
