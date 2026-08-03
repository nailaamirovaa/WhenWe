//
//  RecurringRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol RecurringRepository {
    func createSeries(groupId: String,
                      schedule: RecurringSchedule,
                      timeZone: String,
                      template: RecurringTemplateInput,
                      interval: Int?,
                      askOffset: String?) async throws -> RecurringSeries
    func getSeries(seriesId: String) async throws -> RecurringSeries
    func updateSeries(seriesId: String,
                      schedule: RecurringSchedule?,
                      timeZone: String?,
                      template: RecurringTemplateInput?,
                      interval: Int?,
                      askOffset: String?) async throws -> RecurringSeries
    func stopSeries(seriesId: String) async throws
}

