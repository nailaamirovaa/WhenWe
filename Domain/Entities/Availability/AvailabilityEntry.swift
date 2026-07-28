//
//  AvailabilityEntry.swift
//  WhenWe
//
//  Created by Naila Amirova on 27.07.26.
//

import Foundation

struct AvailabilityEntry: Identifiable {
    
    let weekday: Int
    let slot: String // "am" | "pm" | "eve".
    let state: String // "free" | "maybe" | "busy".
    var id: String { "\(weekday)-\(slot)" }
}
