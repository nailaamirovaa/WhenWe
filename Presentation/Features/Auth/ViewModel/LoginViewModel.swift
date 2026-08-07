//
//  LoginViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 07.08.26.
//

import Foundation

@Observable
final class LoginViewModel {

    private let repository: AuthRepository

    var isLoading = false
    var error: Error?
    var name: String = ""
    
    init(repository: AuthRepository = AuthRepositoryImplementation(service: AuthService(),
                                                                     authSession: .shared)) {
        self.repository = repository
    }

    //MARK: - Sing In with Apple
    func signInWithApple(idToken: String, fullName: String?) async -> AuthResult? {
        isLoading = true
        defer { isLoading = false }

        do {
            return try await repository.signInWithApple(idToken: idToken, fullName: fullName)
        } catch {
            self.error = error
            return nil
        }
    }

    //MARK: - Sing In with Google
    func signInWithGoogle(idToken: String, fullName: String?) async -> AuthResult? {
        isLoading = true
        defer { isLoading = false }

        do {
            return try await repository.signInWithGoogle(idToken: idToken, fullName: fullName)
        } catch {
            self.error = error
            return nil
        }
    }
}
