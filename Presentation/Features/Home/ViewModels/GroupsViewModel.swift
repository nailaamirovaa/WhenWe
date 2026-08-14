//
//  GroupsViewModel.swift
//  WhenWe
//
//  Created by Naila Amirova on 11.08.26.
//

import Foundation
import SwiftUI

@Observable
final class GroupsViewModel {
    private let repository: GroupRepository
    
    var isLoading: Bool = false
    var error: Error?
    
    var groups: [Groups]?
    
    init(repository: GroupRepository = GroupRepositoryImplementation(service: GroupsService())) {
        self.repository = repository
    }
    
    func getGroups() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            groups = try await repository.getGroups()
        } catch {
            self.error = error
        }
    }
    
    func createGroup(name: String, activityType: String, activityLabel: String?, emoji: String?) async -> Groups? {
        isLoading = true
        defer { isLoading = false }
        
        do {
            return try await repository.createGroup(name: name,
                                   activityType: activityType,
                                   activityLabel: activityLabel,
                                   emoji: emoji)
        } catch {
            self.error = error
            return nil
        }
    }
}
