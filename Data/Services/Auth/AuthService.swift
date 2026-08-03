//
//  AuthService.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

public final class AuthService {
    
    static let shared = AuthService()
    
    
    // MARK: - Apple Sign In
    func appleSignIn(request: AppleSignInRequestDTO) async throws -> AppleSignInResponseDTO {
        try await NetworkManager.shared.request(apiRequest: AuthRequest.appleSignIn(request),
                                                responseType: AppleSignInResponseDTO.self)
    }
    
    // MARK: - Google Sign In
    func googleSignIn(request: GoogleSignInRequestDTO) async throws -> GoogleSignInResponseDTO {
        try await NetworkManager.shared.request(apiRequest: AuthRequest.googleSignIn(request),
                                                responseType: GoogleSignInResponseDTO.self)
    }
    
    // MARK: - Refresh Token
    func refreshToken(request: RefreshTokenRequestDTO) async throws -> RefreshTokenResponseDTO {
        try await NetworkManager.shared.request(apiRequest: AuthRequest.refreshToken(request),
                                                responseType: RefreshTokenResponseDTO.self)
    }
    
    // MARK: - Logout
    func logout(request: LogoutRequestDTO) async throws {
        try await NetworkManager.shared.requestVoid(apiRequest: AuthRequest.logout(request))
    }
}
