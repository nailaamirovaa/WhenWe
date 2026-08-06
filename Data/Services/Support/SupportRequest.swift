//
//  SupportRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum SupportRequest: APIRequest {
    
    case helpArticles(waitlist: String)
    case createSupportTicket(CreateTicketRequestDTO)
    case createFeatureSuggestion(CreateFeatureSuggestionRequestDTO)
    
    
    var path: String {
        switch self {
        case .helpArticles:
            return "/support/articles"
        case .createSupportTicket:
            return "/support/tickets"
        case .createFeatureSuggestion:
            return "/support/feature-suggestions"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .helpArticles:
            return .get
        case .createSupportTicket, .createFeatureSuggestion:
            return .post
        }
    }

    var body: Data? {
        switch self {
        case .helpArticles:
            return nil
        case .createSupportTicket(let request):
            return try? JSONEncoder().encode(request)
        case .createFeatureSuggestion(let request):
            return try? JSONEncoder().encode(request)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .helpArticles(let waitlist):
            let items = [URLQueryItem(name: "query", value: waitlist)]
            return items
        default:
            return nil
        }
    }
}
