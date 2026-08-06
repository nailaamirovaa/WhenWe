//
//  UsersRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

import Foundation

enum UsersRequest: APIRequest {
    
    case getMe
    case updateMe(UpdateMeRequestDTO)
    case deleteMe
    
    
    var path: String {
        switch self {
        default:
            return "/users/me"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMe:
            return .get
        case .updateMe:
            return .patch
        case .deleteMe:
            return .delete
        }
    }

    var body: Data? {
        switch self {
        case .getMe, .deleteMe:
            return nil
        case .updateMe(let request):
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
