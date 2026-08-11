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
    
    private let groupRepository: GroupRepository
    private let eventRepository: EventRepository
    
    init(groupRepository: GroupRepository = GroupRepositoryImplementation(service: GroupsService()),
         eventRepository: EventRepository = EventRepositoryImplementation(service: EventsService()) ) {
        self.groupRepository = groupRepository
        self.eventRepository = eventRepository
    }
    
    var isLoading = false
    var error: Error?

    var groupName: String = ""
    var activitySelection: ActivitySelection? = .preset(.football)
    var customActivityName: String = ""
    var isAddingCustomActivity: Bool = false
    var groupId: String = ""
    var selectedTimeOption: EventTimeOption = .nextMonday
    var eventLocation: String = ""

    var inviteLink: String = "whenwe.app/e/x8k2"

    var canContinueFromGroupSetup: Bool {
        !groupName.trimmingCharacters(in: .whitespaces).isEmpty && activitySelection != nil
    }

    var canContinueFromFirstEvent: Bool {
        !eventLocation.trimmingCharacters(in: .whitespaces).isEmpty
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
    
    func createGroup(name: String, activityType: String, activityLabel: String?, emoji: String) async -> Groups? {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let group = try await groupRepository.createGroup(name: name, activityType: activityType, activityLabel: activityLabel, emoji: emoji)
            groupId = group.id
            return group
        } catch {
            self.error = error
            return nil
        }
    }
    
    func createEvent(startsAt: String, locationName: String) async -> Event? {
        isLoading = true
        defer { isLoading = false }
        
        do {
           let event =  try await eventRepository.createEvent(groupId: groupId, params: .init(startsAt: startsAt, timeZone: TimeZone.current.identifier, title: nil, durationMin: nil, locationName: locationName, locationAddress: nil, lat: nil, lng: nil, notes: nil, capacity: nil, minPlayers: nil, waitlistEnabled: nil))
            inviteLink = event.shareURL ?? ""
            return event
        } catch {
            self.error = error
            return nil
        }
    }
}
