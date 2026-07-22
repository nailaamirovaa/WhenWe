//
//  EventActivity.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation

enum EventActivity: String, CaseIterable, Identifiable {

    case football
    case basketball
    case tennis

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .football: return "⚽"
        case .basketball: return "🏀"
        case .tennis: return "🎾"
        }
    }

    var title: String {
        switch self {
        case .football: return "Football"
        case .basketball: return "Basketball"
        case .tennis: return "Tennis"
        }
    }
}
