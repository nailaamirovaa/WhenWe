//
//  GroupsService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class GroupsService {
    
    //MARK: - Create Group
    func createGroup(request: CreateGroupRequestDTO) async throws -> GroupResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.createGroup(request),responseType: GroupResponseDTO.self)
    }
    
    //MARK: - List Groups
    func getGroups() async throws -> [GroupResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.listGroups,responseType: [GroupResponseDTO].self)
    }
    
    //MARK: - Get Group Detail
    func getGroupDetail(groupId: String) async throws -> GroupResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.getGroupDetail(groupId: groupId),
                                                       responseType: GroupResponseDTO.self)
    }
    
    //MARK: - Update Group
    func updateGroup(groupId: String, request: UpdateGroupRequestDTO) async throws -> GroupResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.updateGroup(groupId: groupId, request),
                                                       responseType: GroupResponseDTO.self)
    }
    
    //MARK: - Rotate Invite Link
    func rotateInviteLink(groupId: String) async throws -> InviteLinkResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.rotateInviteLink(groupId: groupId),
                                                       responseType: InviteLinkResponseDTO.self)
    }
    
    //MARK: - Join Preview
    func joinPreview(inviteCode: String) async throws -> JoinPreviewResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.joinPreview(inviteCode: inviteCode),
                                                       responseType: JoinPreviewResponseDTO.self)
    }
    
    //MARK: - Add Member
    func addMember(groupId: String, request: AddMemberRequestDTO) async throws -> MembershipResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.addMember(groupId: groupId, request),
                                                       responseType: MembershipResponseDTO.self)
    }
    
    //MARK: - Remove Member
    func removeMember(groupId: String, membershipId: String) async throws {
         try await NetworkManager.shared.requestVoid(apiRequest: GroupsRequest.removeMember(groupId: groupId, membershipId: membershipId))
    }
    
    //MARK: - Claim Membership
    func claimMembership(groupId: String, request: ClaimMemberRequestDTO) async throws -> MembershipResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: GroupsRequest.claimMembership(groupId: groupId, request),
                                                       responseType: MembershipResponseDTO.self)
    }
}

