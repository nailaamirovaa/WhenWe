//
//  User.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct User: Identifiable {

    let id: String
    let locale: String
    let timeZone: String
    let isPro: Bool
    let createdAt: String
    let updatedAt: String
    let appleUserId: String?
    let googleUserId: String?
    let fullName: String?
    let avatarUrl: String?
    let deletedAt: String?
    let counts: UserCounts?
}
