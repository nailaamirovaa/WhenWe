//
//  StatsRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum StatsRequest: APIRequest {
    case getGroupStats(groupId: String, period: String)
    case getStatsCard(groupId: String)
    
    var path: String {
        switch self {
        case .getStatsCard(let groupId):
            return "/groups/\(groupId)/stats/share"
        case .getGroupStats(let groupId, _):
            return "/groups/\(groupId)/stats"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
                return .get
        }
    }
    
    var body: Data? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getGroupStats(_, let period):
            let items = [URLQueryItem(name: "period", value: String(period))]
            return items
        default:
            return nil
        }
    }
}
