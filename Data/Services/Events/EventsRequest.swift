//
//  EventsRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

enum EventsRequest: APIRequest {
    
    case createEvent(groupId: String,request: CreateEventRequestDTO)
    case listUpcomingEvents(cursor: String?, limit: Int)
    case getEvent(eventId: String)
    case updateEvent(eventId: String, UpdateEventRequestDTO)
    case cancelEvent(eventId: String)
    case completeEvent(eventId: String)
    
    var path: String {
        switch self {
        case .createEvent(let groupId, _):
            return "/groups/\(groupId)/events"
        case .listUpcomingEvents:
            return "/events"
        case .getEvent(let eventId):
            return "/events/\(eventId)"
        case .updateEvent(let eventId, _):
            return "/events/\(eventId)/update"
        case .cancelEvent(let eventId):
            return "/events/\(eventId)/cancel"
        case .completeEvent(let eventId):
            return "/events/\(eventId)/complete"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createEvent, .cancelEvent, .completeEvent:
                return .post
        case .listUpcomingEvents, .getEvent:
                return .get
        case .updateEvent:
                return .patch
       
        }
    }
    
    var body: Data? {
        switch self {
        case .createEvent(_, let request):
            return try? JSONEncoder().encode(request)
        case .updateEvent(_, let request):
            return try? JSONEncoder().encode(request)
        case .listUpcomingEvents, .getEvent, .cancelEvent, .completeEvent:
            return nil
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .listUpcomingEvents(let cursor, let limit):
            var items = [URLQueryItem(name: "limit", value: String(limit))]
            if let cursor {
                items.append(URLQueryItem(name: "cursor", value: cursor))
            }
            return items
        default:
            return nil
        }
    }
}
