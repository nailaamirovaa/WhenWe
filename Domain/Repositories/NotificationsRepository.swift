//
//  NotifiationsRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol NotificationsRepository {
    func registerDevice(apnsToken: String, deviceId: String, environment: String) async throws -> PushDevice
    func removeDevice(rowId: String) async throws
    func getPreferences() async throws -> NotificationPreferences
    func updatePreferences(_ input: NotificationPreferencesInput) async throws -> NotificationPreferences
}
