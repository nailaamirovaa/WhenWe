//
//  Rsvp.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct Rsvp: Identifiable {

    let id: String
    let eventId: String
    let membershipId: String
    let response: String
    let respondedAt: String
    let source: String
    let guestCount: Int
    let createdAt: String
    let updatedAt: String
}
