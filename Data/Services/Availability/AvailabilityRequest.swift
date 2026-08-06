//
//  AvailabilityRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

enum AvailabilityRequest: APIRequest {
    
    
    case getMyAvailability
    case updateMyAvailability(UpdateAvailabilityRequestDTO)
    case getOverlap(groupId: String)
    
    var path: String {
        switch self {
        case .getMyAvailability:
            return "/users/me/availability"
        case .updateMyAvailability:
            return "/users/me/availability"
        case .getOverlap(let groupId):
            return "/groups/\(groupId)/overlap"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMyAvailability, .getOverlap:
            return .get
        case .updateMyAvailability:
            return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .getMyAvailability, .getOverlap:
            return nil
        case .updateMyAvailability(let request):
            return try? JSONEncoder().encode(request)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}
