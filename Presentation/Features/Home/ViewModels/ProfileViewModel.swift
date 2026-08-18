//
//  ProfileViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 18.08.26.
//

import Foundation

@Observable
final class ProfileViewModel {
    
    private var repository: UsersRepository
    
    var user: User?
    var isLoading = false
    var error: Error?
    
    init(repository: UsersRepository = UsersRepositoryImplementation(service: UsersService())) {
        self.repository = repository
    }
    
    func getMe() async  {
        isLoading = true
        defer { isLoading = false }
        
        do {
            user = try await repository.getMe()
        } catch {
            self.error = error
        }
    }
    
    func updateMe(name: String?, avatar: String) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            user = try await repository.updateMe(fullName: name, avatarURL: avatar, locale: nil, timeZone: TimeZone.current.identifier)
        } catch {
            self.error = error
        }
    }
}
