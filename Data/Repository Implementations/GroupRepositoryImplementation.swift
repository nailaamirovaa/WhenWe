//
//  GroupRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class GroupRepositoryImplementation: GroupRepository {
    
    private let service: GroupsService
    
    init(service: GroupsService) {
        self.service = service
    }
    
    //MARK: - Create Group
    func createGroup(name: String, activityType: String, activityLabel: String?, emoji: String?) async throws -> Groups {
        let dto = try await service.createGroup(request: CreateGroupRequestDTO(name: name,
                                                                              activityType: activityType,
                                                                              activityLabel: activityLabel,
                                                                              emoji: emoji))
        return try dto.toEntity()
    }
    
    //MARK: - Get Groups
    func getGroups() async throws -> [Groups] {
        let dto = try await service.getGroups()
        let groups = try dto.map { try $0.toEntity()}
        
        return groups
    }
    
    //MARK: - Get Group Details
    func getGroupDetails(groupId: String) async throws -> Groups {
        let dto = try await service.getGroupDetail(groupId: groupId)
        
        return try dto.toEntity()
    }
    
    //MARK: - Update Group
    func updateGroup(groupId: String, name: String?, emoji: String?, photoUrl: String?, archived: Bool?) async throws -> Groups {
        let dto = try await service.updateGroup(groupId: groupId, request: UpdateGroupRequestDTO(name: name,
                                                                                                emoji: emoji,
                                                                                                photoUrl: photoUrl,
                                                                                                archived: archived))
    
        return try dto.toEntity()
    }
    
    //MARK: - Rotate Invite Link
    func rotateInviteLink(groupId: String) async throws -> InviteLink {
        let dto = try await service.rotateInviteLink(groupId: groupId)
        
        return try dto.toEntity()
    }
    
    //MARK: - Gt Join Preview
    func getJoinPreview(inviteCode: String) async throws -> JoinPreview {
        let dto = try await service.joinPreview(inviteCode: inviteCode)
        
        return try dto.toEntity()
    }
    
    //MARK: - Add Member
    func addMember(groupId: String, displayName: String, avatarURL: String?) async throws -> Membership {
        let dto = try await service.addMember(groupId: groupId, request: AddMemberRequestDTO(displayName: displayName,
                                                                                            avatarUrl: avatarURL))
        
        return try dto.toEntity()
    }
    
    //MARK: - Delete Member
    func deleteMember(groupId: String, membershipId: String) async throws {
        try await service.removeMember(groupId: groupId, membershipId: membershipId)
    }
    
    //MARK: - Claim Membership
    func claimMembership(groupId: String, memberToken: String) async throws -> Membership {
        let dto = try await service.claimMembership(groupId: groupId, request: ClaimMemberRequestDTO(memberToken: memberToken))
        
        return try dto.toEntity()
    }
}
