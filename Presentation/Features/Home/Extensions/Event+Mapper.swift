//
//  Event+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 11.08.26.
//

import Foundation

extension Event {
    
    var groupEventStatus: GroupEventStatus {
        let going = counts?.going ?? 0
        let waiting = counts?.waiting ?? 0
        
        if waiting > 0 { return .waitlist }
        if status == "confirmed" { return .confirmed }
        if let minPlayers, going < minPlayers { return .needsMore(minPlayers - going) }
        return .confirmed
    }
    
    var startsAtDate: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: startsAt)
    }
    
    func toNextEventSummary() -> NextEventSummary {
        
        return NextEventSummary(title: title ?? "",
                                dayTime: startsAtDate,
                                going: counts?.going ?? 0,
                                total: capacity ?? 0,
                                minimumRequired: minPlayers ?? 0,
                                location: locationName ?? "",
                                status: groupEventStatus)
    }
}
