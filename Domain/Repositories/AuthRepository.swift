//
//  AuthRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 30.07.26.
//

protocol AuthRepository {
    func signInWithApple(idToken: String, fullName: String?) async throws -> AuthResult
    func signInWithGoogle(idToken: String, fullName: String?) async throws -> AuthResult
    func logout() async throws
    func refreshSession(refreshToken: String) async throws -> AuthTokens
}
