//
//  Auth.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class AuthRepositoryImplementation: AuthRepository {

    private let service: AuthService
    private let authSession: AuthSessionManager
    
    init(service: AuthService, authSession: AuthSessionManager) {
        self.service = service
        self.authSession = authSession
    }
    
    //MARK: - Sign in with Apple
    func signInWithApple(idToken: String, fullName: String?) async throws -> AuthResult {
        let dto = try await service.appleSignIn(request: AppleSignInRequestDTO(identityToken: idToken, fullName: fullName))

        let tokens = AuthTokens(accessToken: dto.tokens?.accessToken ?? "",
                                refreshToken: dto.tokens?.refreshToken ?? "",
                                expiresIn: dto.tokens?.expiresIn ?? 0)
        
        authSession.save(tokens)
        
        return try dto.toEntity()
    }
    
    //MARK: - Sign in with Google
    func signInWithGoogle(idToken: String, fullName: String?) async throws -> AuthResult {
        let dto = try await service.googleSignIn(request: GoogleSignInRequestDTO(idToken: idToken, fullName: fullName))

        let tokens = AuthTokens(accessToken: dto.tokens?.accessToken ?? "",
                                refreshToken: dto.tokens?.refreshToken ?? "",
                                expiresIn: dto.tokens?.expiresIn ?? 0)
        
        authSession.save(tokens)
        
        return try dto.toEntity()
    }
    
    //MARK: - Logout
    func logout() async throws {
        try await service.logout(request: LogoutRequestDTO())
        authSession.clear()
    }
    
    //MARK: - Refresh Session
    func refreshSession(refreshToken: String) async throws {
        let dto = try await service.refreshToken(request: RefreshTokenRequestDTO(refreshToken: refreshToken))
        
        let tokens = AuthTokens(accessToken: dto.accessToken ?? "",
                                refreshToken: dto.refreshToken ?? "",
                                expiresIn: dto.expiresIn ?? 0)
        
        authSession.save(tokens)
    }
}
