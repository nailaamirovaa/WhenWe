//
//  Membership.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct Membership: Identifiable {

    let id: String
    let groupId: String
    let displayName: String
    let role: String
    let status: String
    let joinedVia: String
    let createdAt: String
    let updatedAt: String
    let userId: String?
    let avatarUrl: String?
    let memberTokenId: String?
}
