//
//  HelpAndFeedbackViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.08.26.
//

import Foundation

@Observable
final class HelpAndFeedbackViewModel {

    private let repository: SupportRepository

    var articles: [SupportArticle] = []
    var isLoadingArticles = false
    var isSubmitting = false
    var error: Error?

    init(repository: SupportRepository = SupportRepositoryImplementation(service: SupportService())) {
        self.repository = repository
    }

    func loadArticles(query: String? = nil) async {
        isLoadingArticles = true
        defer { isLoadingArticles = false }

        do {
            articles = try await repository.searchArticles(query: query)
        } catch {
            self.error = error
        }
    }

    @discardableResult
    func submitTicket(type: String, subject: String, body: String) async -> Bool {
        isSubmitting = true
        defer { isSubmitting = false }

        do {
            _ = try await repository.createTicket(type: type, subject: subject, body: body)
            return true
        } catch {
            self.error = error
            return false
        }
    }

    @discardableResult
    func submitFeatureSuggestion(subject: String, body: String) async -> Bool {
        isSubmitting = true
        defer { isSubmitting = false }

        do {
            _ = try await repository.createFeatureSuggestion(subject: subject, body: body)
            return true
        } catch {
            self.error = error
            return false
        }
    }
}
