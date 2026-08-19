//
//  RSVPRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum RSVPRequest: APIRequest {

    case submitRSVP(eventId: String, RsvpRequestDTO)
    case markAttendance(eventId: String, MarkAttendanceRequestDTO)


    var path: String {
        switch self {
        case .submitRSVP(let eventId, _):
            return "/events/\(eventId)/rsvp"
        case .markAttendance(let eventId, _):
            return "/events/\(eventId)/rsvp/attendance"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .submitRSVP:
            return .post
        case .markAttendance:
            return .patch
        }
    }

    var body: Data? {
        switch self {
        case .submitRSVP(_, let request):
            return try? JSONEncoder().encode(request)
        case .markAttendance(_, let request):
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

