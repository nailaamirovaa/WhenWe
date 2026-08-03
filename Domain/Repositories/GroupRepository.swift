//
//  GroupRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 30.07.26.
//

protocol GroupRepository {
    func createGroup(name: String,
                     activityType: String,
                     activityLabel: String?,
                     emoji: String?) async throws -> Groups
    func getGroups() async throws -> [Groups]
    func getGroupDetails(groupId: String) async throws -> Groups
    func updateGroup(groupId: String,
                     name: String?,
                     emoji: String?,
                     photoUrl: String?,
                     archived: Bool?) async throws -> Groups
    func rotateInviteLink(groupId: String) async throws -> InviteLink
    func getJoinPreview(inviteCode: String) async throws -> JoinPreview
    func addMember(groupId: String, displayName: String, avatarURL: String?) async throws -> Membership
    func deleteMember(groupId: String, membershipId: String) async throws
    func claimMembership(groupId: String, memberToken: String) async throws -> Membership
}
