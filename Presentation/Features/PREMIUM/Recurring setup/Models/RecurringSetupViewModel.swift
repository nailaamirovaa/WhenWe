//
//  RecurringSetupViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation
import Observation

@Observable
final class RecurringSetupViewModel {

    var selectedDays: Set<Int> = [0]
    var askGroupSchedule = "Saturdays · 10:00"

    let dayLabels = ["M", "T", "W", "T", "F", "S", "S"]

    private let fullDayNames = [
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    ]

    func toggleDay(_ index: Int) {
        if selectedDays.contains(index) {
            selectedDays.remove(index)
        } else {
            selectedDays.insert(index)
        }
    }

    var summaryTitle: String {
        guard let firstDay = selectedDays.sorted().first else { return "Pick a day" }
        return "Every \(fullDayNames[firstDay]) · 20:00"
    }
}
