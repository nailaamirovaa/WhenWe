//
//  WaitlistRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum WaitlistRequest: APIRequest {
    
    case getWaitlist(eventId: String)
    case promotenextWaiting(eventId: String)
    
    var path: String {
        switch self {
        case .getWaitlist(let eventId):
            return "/events/\(eventId)/waitlist"
        case .promotenextWaiting(let eventId):
            return "/events/\(eventId)/waitlist/promote"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getWaitlist:
            return .get
        case .promotenextWaiting:
            return .post
        }
    }
    
    var body: Data? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    
}
