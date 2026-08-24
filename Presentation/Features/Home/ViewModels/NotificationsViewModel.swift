//
//  NotificationsViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.08.26.
//

import Foundation

@Observable
final class NotificationsViewModel {

    private let repository: NotificationsRepository

    var preferences: NotificationPreferences?
    var isLoading = false
    var error: Error?

    init(repository: NotificationsRepository = NotificationRepositoryImplementation(service: NotificationService())) {
        self.repository = repository
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            preferences = try await repository.getPreferences()
        } catch {
            self.error = error
        }
    }

    func update(_ input: NotificationPreferencesInput) async -> Bool {
        do {
            preferences = try await repository.updatePreferences(input)
            return true
        } catch {
            self.error = error
            return false
        }
    }
}
