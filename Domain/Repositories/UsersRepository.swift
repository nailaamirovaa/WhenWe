//
//  UsersRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 30.07.26.
//

protocol UsersRepository {
    func getMe() async throws -> User
    func updateMe(fullName: String?, avatarURL: String?, locale: String?, timeZone: String?) async throws -> User
    func deleteMe() async throws
}
