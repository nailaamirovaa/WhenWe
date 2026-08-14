//
//  Groups+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 11.08.26.
//


extension Groups {
    
    func toSummary() -> GroupSummary {
       
        return GroupSummary(id: id,
                            emoji: emoji,
                            name: name,
                            memberCount: memberCount ?? 0,
                            activityName: activityType,
                            nextEvent: nextEvent?.toNextEventSummary()
        )
    }
}
