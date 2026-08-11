//
//  LoginViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 07.08.26.
//

import Foundation

@Observable
final class LoginViewModel {

    private let authRepository: AuthRepository
    private let userRepository: UsersRepository

    var isLoading = false
    var error: Error?
    var name: String = "Naila Amirova"
    
    init(authRepository: AuthRepository = AuthRepositoryImplementation(service: AuthService(),
                                                                     authSession: .shared),
         userRepository: UsersRepository = UsersRepositoryImplementation(service: UsersService())) {
        self.authRepository = authRepository
        self.userRepository = userRepository
    }

    //MARK: - Sing In with Apple
    func signInWithApple(idToken: String, fullName: String?) async -> AuthResult? {
        isLoading = true
        defer { isLoading = false }

        do {
            name = fullName ?? ""
            return try await authRepository.signInWithApple(idToken: idToken, fullName: fullName)
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
            name = fullName ?? ""
            return try await authRepository.signInWithGoogle(idToken: idToken, fullName: fullName)
        } catch {
            self.error = error
            return nil
        }
    }
    
    //MARK: - Change name
    func changeName(fullName: String) async -> User? {
        isLoading = true
        defer { isLoading = false }
        
        do {
            return try await userRepository.updateMe(fullName: fullName, avatarURL: nil, locale: nil, timeZone: nil)
        } catch {
            self.error = error
            return nil
        }
    }
}
