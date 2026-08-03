//
//  PushDevice.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

import Foundation

struct PushDevice: Identifiable {

    let id: String
    let userId: String
    let apnsToken: String
    let bundleEnv: String
    let deviceId: String
    let lastSeenAt: String
    let active: Bool
    let createdAt: String
    let updatedAt: String
}
