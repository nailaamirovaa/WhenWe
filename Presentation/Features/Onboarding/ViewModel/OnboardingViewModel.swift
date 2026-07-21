//
//  OnboardingViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation
import Observation

@Observable
final class OnboardingViewModel {

    var groupName: String = ""
    var activitySelection: ActivitySelection? = .preset(.football)
    var customActivityName: String = ""
    var isAddingCustomActivity: Bool = false

    var selectedTimeOption: EventTimeOption = .nextMonday
    var eventLocation: String = ""

    var inviteLink: String = "whenwe.app/e/x8k2"

    var canContinueFromGroupSetup: Bool {
        !groupName.trimmingCharacters(in: .whitespaces).isEmpty && activitySelection != nil
    }

    var canContinueFromFirstEvent: Bool {
        !eventLocation.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var shareURL: URL {
        URL(string: "https://\(inviteLink)") ?? URL(string: "https://whenwe.app")!
    }

    func selectPreset(_ type: ActivityType) {
        activitySelection = .preset(type)
        isAddingCustomActivity = false
    }

    func selectOther() {
        isAddingCustomActivity = true
        if case .other(let name) = activitySelection ?? .preset(.football) {
            customActivityName = name
        }
        activitySelection = customActivityName.isEmpty ? nil : .other(customActivityName)
    }

    func updateCustomActivityName(_ name: String) {
        customActivityName = name
        activitySelection = name.trimmingCharacters(in: .whitespaces).isEmpty ? nil : .other(name)
    }
}
