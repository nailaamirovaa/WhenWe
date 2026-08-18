//
//  EventDetailViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 17.08.26.
//

import Foundation

@Observable
final class EventDetailViewModel {

    private let eventRepository: EventRepository
    private let rsvpRepository: RSVPRepository
    private let usersRepository: UsersRepository

    var event: Event
    var isLoading: Bool = false
    var error: Error?
    var currentUserId: String?

    init(event: Event,
         eventRepository: EventRepository = EventRepositoryImplementation(service: EventsService()),
         rsvpRepository: RSVPRepository = RSVPRepositoryImplementation(service: RSVPService()),
         usersRepository: UsersRepository = UsersRepositoryImplementation(service: UsersService())) {
        self.eventRepository = eventRepository
        self.event = event
        self.rsvpRepository = rsvpRepository
        self.usersRepository = usersRepository
    }

    var myRSVP: RSVPChoice? {
        guard let currentUserId,
              let mine = event.rsvps?.first(where: { $0.membershipUserId == currentUserId }) else {
            return nil
        }
        return RSVPChoice(backendValue: mine.response)
    }

    func loadCurrentUser() async {
        do {
            currentUserId = try await usersRepository.getMe().id
        } catch {
            self.error = error
        }
    }

    func refresh() async {
        isLoading = true
        defer { isLoading = false }
        do {
            event = try await eventRepository.getEvent(eventId: event.id)
        } catch {
            self.error = error
        }
    }

    func submitRSVP(_ choice: RSVPChoice) async {
        isLoading = true
        defer { isLoading = false }
        do {
            _ = try await rsvpRepository.submitRsvp(eventId: event.id, response: choice.backendValue, guestCount: nil)
            await refresh()
        } catch {
            self.error = error
        }
    }
}
