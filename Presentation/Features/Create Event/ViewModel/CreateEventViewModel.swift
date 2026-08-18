//
//  CreateEventViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation
import Observation

@Observable
final class CreateEventViewModel {

    private let repository: EventRepository
    
    init(repository: EventRepository = EventRepositoryImplementation(service: EventsService())) {
        self.repository = repository
    }
    
    var selectedActivity: EventActivity? = .football
    var customActivityName = ""
    var selectedGroupName = ""
    var useQuickPick = true
    var selectedDay = 0
    var selectedHour = 20
    var selectedGroup: Groups?
    var eventLocation = ""
    var minPlayers = 8
    var costPerPerson = "5"
    var waitlistEnabled = false
    var autoRemindersEnabled = false
    
    var isLoading: Bool = false
    var error: Error?

    private let dayNames = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    private var startsAtDate: Date {
        let calendar = Calendar.current
        let today = Date()
        let todayWeekday = calendar.component(.weekday, from: today)

        let targetWeekday = selectedDay == 6 ? 1 : selectedDay + 2

        var delta = targetWeekday - todayWeekday
        if delta <= 0 { delta += 7 }

        let day = calendar.date(byAdding: .day, value: delta, to: today) ?? today
        return calendar.date(bySettingHour: selectedHour, minute: 0, second: 0, of: day) ?? day
    }

    private var startsAtISO: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter.string(from: startsAtDate)
    }

    var selectedTimeLabel: String {
        "\(dayNames[selectedDay]) \(String(format: "%02d:00", selectedHour))"
    }

    func selectActivity(_ activity: EventActivity) {
        selectedActivity = activity
        customActivityName = ""
    }

    func updateCustomActivity(_ name: String) {
        customActivityName = name
        selectedActivity = name.trimmingCharacters(in: .whitespaces).isEmpty ? selectedActivity : nil
    }

    
    func createEvent() async -> Event? {
        isLoading = true
        defer { isLoading = false }
        
        do {
            guard let id = selectedGroup?.id else {
                self.error = CreateEventError.noGroupSelected
                return nil
            }
            
            return try await repository.createEvent(groupId: id, params: .init(startsAt: startsAtISO, timeZone: TimeZone.current.identifier, title: nil, durationMin: nil, locationName: eventLocation, locationAddress: nil, lat: nil, lng: nil, notes: nil, capacity: nil, minPlayers: minPlayers, waitlistEnabled: waitlistEnabled)
            )
        } catch {
            self.error = error
            return nil
        }
    }
}
