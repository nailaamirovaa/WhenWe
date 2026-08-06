//
//  NotificationRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum NotificationRequest: APIRequest {
    
    case registerPushDevice(RegisterDeviceRequestDTO)
    case removePushDevice(rowId: String)
    case getNotificationPreferences
    case updateNotificationPreferences(UpdatePreferencesRequestDTO)
    
    var path: String {
        switch self {
        case .registerPushDevice:
            return "/push/devices"
        case .removePushDevice(let rowId):
            return "/push/devices/\(rowId)"
        case .getNotificationPreferences:
            return "/users/me/notification-preferences"
        case .updateNotificationPreferences:
            return "/users/me/notification-preferences"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .registerPushDevice:
                return .post
        case .removePushDevice:
                return .delete
        case .getNotificationPreferences:
                return .get
        case .updateNotificationPreferences:
                return .put
        }
    }
    
    var body: Data? {
        switch self {
        case .registerPushDevice(let request):
            return try? JSONEncoder().encode(request)
        case .updateNotificationPreferences(let request):
            return try? JSONEncoder().encode(request)
        case .getNotificationPreferences, .removePushDevice:
            return nil
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

