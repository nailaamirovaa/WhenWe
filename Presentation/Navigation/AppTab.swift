//
//  AppTab.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

enum AppTab: Int, CaseIterable {
    case groups
    case upcoming
    case profile
    
    var title: String {
        switch self {
        case .groups: "Groups"
        case .upcoming: "Upcoming"
        case .profile: "Profile"
        }
    }
}
