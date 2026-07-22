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

    var selectedActivity: EventActivity? = .football
    var customActivityName = ""

    var useQuickPick = true
    var selectedDay = 0
    var selectedHour = 20

    var eventLocation = ""

    var minPlayers = 8
    var costPerPerson = "5"
    var waitlistEnabled = true
    var autoRemindersEnabled = false

    private let dayNames = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

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
}
