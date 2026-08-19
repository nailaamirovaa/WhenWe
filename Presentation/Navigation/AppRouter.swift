//
//  AppCoordinator.swift
//  WhenWe
//
//  Created by Naila Amirova on 07.08.26.
//

import Combine
import Foundation

@Observable
final class AppRouter {
    
    private var usersRepository: UsersRepository
    private var authSession: AuthSessionManager
    private var eventRepository: EventRepository

    var route: Route = .signIn
    var pendingAttendanceEvents: [PendingAttendanceEvent] = []

    init(usersRepository: UsersRepository = UsersRepositoryImplementation(service: UsersService()),
         authSession: AuthSessionManager = .shared,
         eventRepository: EventRepository = EventRepositoryImplementation(service: EventsService())) {
        self.usersRepository = usersRepository
        self.authSession = authSession
        self.eventRepository = eventRepository
    }
    
    //MARK: - Start App
    func start() async {
        guard authSession.accessToken != nil else {
            route = .signIn
            return 
        }
        await resolveAuthenticatedRoute()
    }
    
    //MARK: - Sign in
    func signedIn(isNew: Bool) {
        if isNew {
            route = .nameSetup
        } else {
            route = .homeTab
            Task { await resolveAuthenticatedRoute()}
        }
    }
    
    //MARK: - Name Setup
    func completedNameSetup() {
        route = .onboarding
    }
    
    //MARK: - Onboarding
    func completedOnboarding() {
        route = .homeTab
    }
    
    //MARK: - Log out
    func loggedOut() {
        authSession.clear()
        route = .signIn
    }
    
    //MARK: - User Check
    private func resolveAuthenticatedRoute() async {
        do {
            let user = try await usersRepository.getMe()
            route = (user.counts?.ownedGroups ?? 0) > 0 ? .homeTab : .onboarding
            if route == .homeTab {
                await loadPendingAttendance()
            }
        } catch {
            authSession.clear()
            route = .signIn
        }
    }

    //MARK: - Pending Attendance
    private func loadPendingAttendance() async {
        pendingAttendanceEvents = (try? await eventRepository.getPendingAttendance()) ?? []
    }
}
