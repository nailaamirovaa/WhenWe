//
//  RecurringSeriesResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension RecurringSeriesResponseDTO {

    func toEntity() throws -> RecurringSeries {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let groupId = groupId else {
            throw MappingError.missingField("groupId")
        }

        guard let timeZone = timeZone else {
            throw MappingError.missingField("timeZone")
        }

        guard let template = template else {
            throw MappingError.missingField("template")
        }

        guard let active = active else {
            throw MappingError.missingField("active")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        guard let interval = interval else {
            throw MappingError.missingField("interval")
        }

        guard let weekdays = weekdays else {
            throw MappingError.missingField("weekdays")
        }

        return RecurringSeries(id: id,
                               groupId: groupId,
                               timeZone: timeZone,
                               template: template.toEntity(),
                               active: active,
                               createdAt: createdAt,
                               updatedAt: updatedAt,
                               interval: interval,
                               rrule: rrule,
                               weekdays: weekdays,
                               time: time,
                               askOffset: askOffset,
                               nextRunAt: nextRunAt,
                               previewDates: previewDates)
    }
}
