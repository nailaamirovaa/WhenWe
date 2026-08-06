//
//  RecurringRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class RecurringRepositoryImplementation: RecurringRepository {

    private let service: RecurringService

    init(service: RecurringService) {
        self.service = service
    }

    //MARK: - Create Series
    func createSeries(groupId: String,
                      schedule: RecurringSchedule,
                      timeZone: String,
                      template: RecurringTemplateInput,
                      interval: Int?,
                      askOffset: String?) async throws -> RecurringSeries {

        var rrule: String? = nil
        var weekdays: [Int]? = nil
        var time: String? = nil

        switch schedule {
        case .rrule(let value):
            rrule = value
        case .weekly(let scheduleWeekdays, let scheduleTime):
            weekdays = scheduleWeekdays
            time = scheduleTime
        }

        let request = CreateRecurringRequestDTO(rrule: rrule,
                                                 weekdays: weekdays,
                                                 time: time,
                                                 interval: interval,
                                                 timeZone: timeZone,
                                                 template: RecurringTemplateRequestDTO(title: template.title,
                                                                                       durationMin: template.durationMin,
                                                                                       locationName: template.locationName,
                                                                                       locationAddress: template.locationAddress,
                                                                                       capacity: template.capacity,
                                                                                       minPlayers: template.minPlayers,
                                                                                       waitlistEnabled: template.waitlistEnabled),
                                                 askOffset: askOffset)

        let dto = try await service.createRecurringSeries(groupId: groupId, request: request)
        return try dto.toEntity()
    }

    //MARK: - Get Series
    func getSeries(seriesId: String) async throws -> RecurringSeries {
        let dto = try await service.getRecurringSeries(recurringId: seriesId)
        return try dto.toEntity()
    }

    //MARK: - Update Series
    func updateSeries(seriesId: String,
                      schedule: RecurringSchedule?,
                      timeZone: String?,
                      template: RecurringTemplateInput?,
                      interval: Int?,
                      askOffset: String?) async throws -> RecurringSeries {

        var rrule: String? = nil
        var weekdays: [Int]? = nil
        var time: String? = nil

        switch schedule {
        case .rrule(let value):
            rrule = value
        case .weekly(let scheduleWeekdays, let scheduleTime):
            weekdays = scheduleWeekdays
            time = scheduleTime
        case .none:
            break
        }

        let request = UpdateRecurringRequestDTO(rrule: rrule,
                                                 weekdays: weekdays,
                                                 time: time,
                                                 interval: interval,
                                                 timeZone: timeZone,
                                                 template: template.map { RecurringTemplateRequestDTO(title: $0.title,
                                                                                                       durationMin: $0.durationMin,
                                                                                                       locationName: $0.locationName,
                                                                                                       locationAddress: $0.locationAddress,
                                                                                                       capacity: $0.capacity,
                                                                                                       minPlayers: $0.minPlayers,
                                                                                                       waitlistEnabled: $0.waitlistEnabled) },
                                                 askOffset: askOffset)

        let dto = try await service.updateRecurringSeries(recurringId: seriesId, request: request)
        return try dto.toEntity()
    }

    //MARK: - Stop Series
    func stopSeries(seriesId: String) async throws {
        try await service.stopRecurringSeries(recurringId: seriesId)
    }
}
