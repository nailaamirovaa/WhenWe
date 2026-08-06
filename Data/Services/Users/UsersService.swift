//
//  UsersService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class UsersService {
    
    // MARK: - Get Me
    func getMe() async throws -> UserResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: UsersRequest.getMe, responseType: UserResponseDTO.self)
    }
    
    // MARK: - Update Me
    func update(request: UpdateMeRequestDTO) async throws -> UserResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: UsersRequest.updateMe(request), responseType: UserResponseDTO.self)
    }
    
    // MARK: - Get Me
    func deleteMe() async throws {
        return try await NetworkManager.shared.requestVoid(apiRequest: UsersRequest.deleteMe)
    }
}
