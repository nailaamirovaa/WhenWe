//
//  AuthRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

enum AuthRequest: APIRequest {
    
    case appleSignIn(AppleSignInRequestDTO)
    case googleSignIn(GoogleSignInRequestDTO)
    case refreshToken(RefreshTokenRequestDTO)
    case logout(LogoutRequestDTO)
    
    var path: String {
        switch self {
        case .appleSignIn:
            return "/auth/apple"
        case .googleSignIn:
            return "/auth/google"
        case .refreshToken:
            return "/auth/refresh"
        case .logout:
            return "/auth/logout"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .appleSignIn, .googleSignIn, .refreshToken, .logout:
            return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .appleSignIn(let request):
            return try? JSONEncoder().encode(request)
        case .googleSignIn(let request):
            return try? JSONEncoder().encode(request)
        case .refreshToken(let request):
            return try? JSONEncoder().encode(request)
        case .logout(let request):
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
