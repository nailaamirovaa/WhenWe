//
//  WidgetRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

import Foundation

enum WidgetRequest: APIRequest {

    case getNextEvent

    var path: String {
        switch self {
        case .getNextEvent:
            return "/widget/next"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getNextEvent:
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
        nil
    }
}
