//
//  NotificationRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class NotificationRepositoryImplementation: NotificationsRepository {
    
    private let service: NotificationService
    
    init(service: NotificationService) {
        self.service = service
    }
    
    //MARK: - Register
    func registerDevice(apnsToken: String, deviceId: String, environment: String) async throws -> PushDevice {
        let dto = try await service.registerPushDevice(request: RegisterDeviceRequestDTO(apnsToken: apnsToken,
                                                                                        deviceId: deviceId,
                                                                                        environment: environment))
        
        return try dto.toEntity()
    }
    
    //MARK: - Remove
    func removeDevice(rowId: String) async throws {
        try await service.removePushDevice(rowId: rowId)
    }
    
    //MARK: - Get Preferences
    func getPreferences() async throws -> NotificationPreferences {
        let dto = try await service.getNotificationPreferences()
        
        return try dto.toEntity()
    }
    
    //MARK: - Update Preferences
    func updatePreferences(_ input: NotificationPreferencesInput) async throws -> NotificationPreferences {
        let dto = try await service.updateNotificationPreferences(request: UpdatePreferencesRequestDTO(newGamePosted: input.newGamePosted,
                                                                                                       rsvpChanges: input.rsvpChanges,
                                                                                                       gameConfirmed: input.gameConfirmed,
                                                                                                       dayBeforeNudge: input.dayBeforeNudge,
                                                                                                       weeklyRecurringAsk: input.weeklyRecurringAsk,
                                                                                                       attendanceCheck: input.attendanceCheck,
                                                                                                       quietStart: input.quietStart,
                                                                                                       quietEnd:  input.quietEnd))
        
        return try dto.toEntity()
    }
}
