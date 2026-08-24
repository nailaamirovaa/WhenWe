//
//  AvailabilityViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.08.26.
//

import Foundation

@Observable
final class AvailabilityViewModel {

    static let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    static let hours = [
        "7am", "8am", "9am", "10am", "11am", "12pm",
        "13pm", "14pm", "15pm", "16pm", "17pm", "18pm",
        "19pm", "20pm", "21pm", "22pm", "23pm", "00am",
        "1am", "2am", "3am", "4am", "5am", "6am"
    ]

    private static let weekdayForDay: [String: Int] = [
        "Sun": 0, "Mon": 1, "Tue": 2, "Wed": 3, "Thu": 4, "Fri": 5, "Sat": 6
    ]

    private let repository: AvailabilityRepository

    var isLoading = false
    var isSaving = false
    var error: Error?

    init(repository: AvailabilityRepository = AvailabilityRepositoryImplementation(service: AvailabilityService())) {
        self.repository = repository
    }

    func load() async -> [DayHour: AvailabilityCellState] {
        isLoading = true
        defer { isLoading = false }

        do {
            let entries = try await repository.getMyAvailability()
            return Self.grid(from: entries)
        } catch {
            self.error = error
            return [:]
        }
    }

    func save(_ grid: [DayHour: AvailabilityCellState]) async -> Bool {
        isSaving = true
        defer { isSaving = false }

        do {
            _ = try await repository.updateMyAvailability(entries: Self.entries(from: grid))
            return true
        } catch {
            self.error = error
            return false
        }
    }

    private static func slot(forHourIndex index: Int) -> String {
        switch index {
        case 0..<5: return "am"
        case 5..<11: return "pm"
        case 11..<17: return "eve"
        default: return "am"
        }
    }

    private static func grid(from entries: [AvailabilityEntry]) -> [DayHour: AvailabilityCellState] {
        var stateByKey: [String: AvailabilityCellState] = [:]
        for entry in entries {
            stateByKey["\(entry.weekday)-\(entry.slot)"] = AvailabilityCellState(rawValue: entry.state) ?? .free
        }

        var grid: [DayHour: AvailabilityCellState] = [:]
        for day in days {
            guard let weekday = weekdayForDay[day] else { continue }
            for (index, hour) in hours.enumerated() {
                let slot = slot(forHourIndex: index)
                grid[DayHour(day: day, hour: hour)] = stateByKey["\(weekday)-\(slot)"] ?? .free
            }
        }
        return grid
    }

    // A bucket covers several hours; if any of them is busier than the others,
    // the whole bucket is sent as that busier state — never rounds up to "free".
    private static func entries(from grid: [DayHour: AvailabilityCellState]) -> [AvailabilityEntryRequestDTO] {
        var worstStateByKey: [String: AvailabilityCellState] = [:]
        var lookup: [String: (weekday: Int, slot: String)] = [:]

        for day in days {
            guard let weekday = weekdayForDay[day] else { continue }
            for (index, hour) in hours.enumerated() {
                let slot = slot(forHourIndex: index)
                let key = "\(weekday)-\(slot)"
                let state = grid[DayHour(day: day, hour: hour)] ?? .free

                if let current = worstStateByKey[key], current.restrictiveness >= state.restrictiveness {
                    continue
                }
                worstStateByKey[key] = state
                lookup[key] = (weekday, slot)
            }
        }

        return worstStateByKey.compactMap { key, state in
            guard let (weekday, slot) = lookup[key] else { return nil }
            return AvailabilityEntryRequestDTO(weekday: weekday, slot: slot, state: state.rawValue)
        }
    }
}
