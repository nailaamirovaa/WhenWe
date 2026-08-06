//
//  AnalyticsRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

enum AnalyticsRequest: APIRequest {
    
    case analyticsBatch(AnalyticsBatchRequestDTO)
    case analyticsEvent(AnalyticsEventRequestDTO)
    
    var path: String {
        switch self {
        case .analyticsBatch:
            return "/analytics/events/batch"
        case .analyticsEvent:
            return "/analytics/events"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .analyticsBatch, .analyticsEvent:
                return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .analyticsBatch(let request):
            return try? JSONEncoder().encode(request)
        case .analyticsEvent(let request):
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
