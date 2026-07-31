//
//  SupportTicket.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

struct SupportTicket: Identifiable {

    let id: String
    let type: String
    let subject: String
    let body: String
    let status: String
    let createdAt: String
    let updatedAt: String
    let userId: String?
}
