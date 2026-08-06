//
//  UsersRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class UsersRepositoryImplementation: UsersRepository {

    private let service: UsersService

    init(service: UsersService) {
        self.service = service
    }

    //MARK: - Get Me
    func getMe() async throws -> User {
        let dto = try await service.getMe()
        return try dto.toEntity()
    }

    //MARK: - Update Me
    func updateMe(fullName: String?, avatarURL: String?, locale: String?, timeZone: String?) async throws -> User {
        let dto = try await service.update(request: UpdateMeRequestDTO(fullName: fullName,
                                                                        avatarUrl: avatarURL,
                                                                        locale: locale,
                                                                        timeZone: timeZone))
        return try dto.toEntity()
    }

    //MARK: - Delete Me
    func deleteMe() async throws {
        try await service.deleteMe()
    }
}
