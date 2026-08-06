//
//  WidgetNextResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension WidgetNextResponseDTO {

    func toEntity() throws -> WidgetSnapshot {

        guard let hasEvent = hasEvent else {
            throw MappingError.missingField("hasEvent")
        }

        return WidgetSnapshot(hasEvent: hasEvent,
                              eventId: eventId,
                              groupEmoji: groupEmoji,
                              activityType: activityType,
                              title: title,
                              startsAt: startsAt,
                              timeZone: timeZone,
                              going: going,
                              capacity: capacity,
                              confirmed: confirmed,
                              goingAvatars: try goingAvatars?.map { try $0.toEntity() })
    }
}
