//
//  ProfileViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

@Observable
final class ProfileViewModel {
    
    private let userRepository: UsersRepository
    private let authRepository: AuthRepository
    
    var user: User?
    var isLoading = false
    var error: Error?
    
    init(userRepository: UsersRepository = UsersRepositoryImplementation(service: UsersService()),
         authRepository: AuthRepository = AuthRepositoryImplementation(service: AuthService(), authSession: AuthSessionManager.shared)) {
        self.userRepository = userRepository
        self.authRepository = authRepository
    }
    
    func getMe() async  {
        isLoading = true
        defer { isLoading = false }
        
        do {
            user = try await userRepository.getMe()
        } catch {
            self.error = error
        }
    }
    
    func updateMe(name: String?, avatar: String?) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            user = try await userRepository.updateMe(fullName: name, avatarURL: avatar, locale: nil, timeZone: TimeZone.current.identifier)
        } catch {
            self.error = error
        }
    }
    
    func deleteMe() async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await userRepository.deleteMe()
        } catch {
            self.error = error
        }
    }
    
    func logout() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            try await authRepository.logout()
        } catch {
            self.error = error
        }
    }
}
