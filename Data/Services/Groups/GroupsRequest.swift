//
//  GroupsRequest.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

enum GroupsRequest: APIRequest {
    
    case createGroup(CreateGroupRequestDTO)
    case listGroups
    case getGroupDetail(groupId: String)
    case updateGroup(groupId: String, UpdateGroupRequestDTO)
    case rotateInviteLink(groupId: String)
    case joinPreview(inviteCode: String)
    case addMember(groupId: String, AddMemberRequestDTO)
    case removeMember(groupId: String, membershipId: String)
    case claimMembership(groupId: String, ClaimMemberRequestDTO)
    
    var path: String {
        switch self {
        case .createGroup:
            return "/groups"
        case .listGroups:
            return "/groups"
        case .getGroupDetail(let groupId):
            return "/groups/\(groupId)"
        case .updateGroup(let groupId, _):
            return "/groups/\(groupId)"
        case .rotateInviteLink(let groupId):
            return "/groups/\(groupId)/invite-link"
        case .joinPreview(let inviteCode):
            return "/groups/join/\(inviteCode)"
        case .addMember(let groupId, _):
            return "/groups/\(groupId)/members"
        case .removeMember(let groupId, let membershipId):
            return "/groups/\(groupId)/members/\(membershipId)"
        case .claimMembership(let groupId, _):
            return "/groups/\(groupId)/members/claim"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createGroup, .rotateInviteLink, .addMember, .claimMembership:
            return .post
        case .listGroups, .getGroupDetail, .joinPreview:
            return .get
        case .updateGroup:
            return .patch
        case .removeMember:
            return .delete
        }
    }
    
    var body: Data? {
        switch self {
        case .createGroup(let request):
            return try? JSONEncoder().encode(request)
        case .updateGroup(_, let request):
            return try? JSONEncoder().encode(request)
        case .addMember(_, let request):
            return try? JSONEncoder().encode(request)
        case .claimMembership(_, let request):
            return try? JSONEncoder().encode(request)
        case .listGroups, .getGroupDetail, .joinPreview, .rotateInviteLink, .removeMember:
            return nil
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

