//
//  RecurringRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum RecurringRequest: APIRequest {
    
    case createRecurringSeries(groupId: String, CreateRecurringRequestDTO)
    case getRecurringSeries(recurringId: String)
    case updateRecurringSeries(recurringId: String, UpdateRecurringRequestDTO)
    case stopRecurringSeries(recurringId: String)
    
    var path: String {
        switch self {
        case .createRecurringSeries(let groupId, _):
            return "/groups/\(groupId)/recurring"
        case .getRecurringSeries(let recurringId):
            return "/recurring/\(recurringId)"
        case .updateRecurringSeries(let recurringId, _):
            return "/recurring/\(recurringId)"
        case .stopRecurringSeries(let recurringId):
            return "/recurring/\(recurringId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createRecurringSeries:
                return .post
        case .getRecurringSeries:
                return .get
        case .updateRecurringSeries:
                return .patch
        case .stopRecurringSeries:
                return .delete
        }
    }
    
    var body: Data? {
        switch self {
        case .createRecurringSeries(_, let request):
            return try? JSONEncoder().encode(request)
        case .updateRecurringSeries(_, let request):
            return try? JSONEncoder().encode(request)
        case .getRecurringSeries, .stopRecurringSeries:
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

