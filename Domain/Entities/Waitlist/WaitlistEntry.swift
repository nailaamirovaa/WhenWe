//
//  WaitlistEntry.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct WaitlistEntry: Identifiable {

    let id: String
    let eventId: String
    let membershipId: String
    let position: Int
    let state: String
    let createdAt: String
    let updatedAt: String
    let promotedAt: String?
    let membership: Membership?
}
