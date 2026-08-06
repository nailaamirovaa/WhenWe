//
//  NotificationService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class NotificationService {
    
    //MARK: - Register Push Device
    func registerPushDevice(request: RegisterDeviceRequestDTO) async throws -> PushDeviceResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: NotificationRequest.registerPushDevice(request),responseType: PushDeviceResponseDTO.self)
    }
    
    //MARK: - Remove Push Device
    func removePushDevice(rowId: String) async throws  {
        return try await NetworkManager.shared.requestVoid(apiRequest: NotificationRequest.removePushDevice(rowId: rowId))
    }
    
    //MARK: - Get Notification Preferences
    func getNotificationPreferences() async throws -> NotificationPreferencesResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: NotificationRequest.getNotificationPreferences,
                                                       responseType: NotificationPreferencesResponseDTO.self)
    }
    
    //MARK: - Update Notification Preferences
    func updateNotificationPreferences(request: UpdatePreferencesRequestDTO) async throws -> NotificationPreferencesResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: NotificationRequest.updateNotificationPreferences(request),
                                                       responseType: NotificationPreferencesResponseDTO.self)
    }
    
}
