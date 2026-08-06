//
//  RSVPRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum RSVPRequest: APIRequest {

    case submitRSVP(eventId: String, RsvpRequestDTO)


    var path: String {
        switch self {
        case .submitRSVP(let eventId, _):
            return "/events/\(eventId)/rsvp"
        }
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }

    var body: Data? {
        switch self {
        case .submitRSVP(_, let request):
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

