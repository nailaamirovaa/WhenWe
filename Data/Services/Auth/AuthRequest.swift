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
            "/auth/apple"
        case .googleSignIn:
            "/auth/google"
        case .refreshToken:
            "/auth/refresh"
        case .logout:
            "/auth/logout"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .appleSignIn, .googleSignIn, .refreshToken, .logout:
                .post
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
