//
//  ActivityType.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import Foundation

enum ActivityType: String, CaseIterable, Identifiable {

    case football = "football"
    case poker = "poker"
    case boardGames = "board_games"
    case badminton = "badminton"
    case gaming = "gaming"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .football: return "⚽"
        case .poker: return "🃏"
        case .boardGames: return "🎲"
        case .badminton: return "🏸"
        case .gaming: return "🎮"
        }
    }

    var title: String {
        switch self {
        case .football: return "Football"
        case .poker: return "Poker"
        case .boardGames: return "Board games"
        case .badminton: return "Badminton"
        case .gaming: return "Gaming"
        }
    }
}

enum ActivitySelection: Equatable {
    case preset(ActivityType)
    case other(String)
    
    var type: String {
        switch self {
        case .preset(let activityType):
            return activityType.rawValue
        case .other(_):
            return "other"
        }
    }

    var title: String? {
        switch self {
        case .preset:
            return nil
        case .other(let string):
            return string
        }
    }
    var emoji: String {
        switch self {
        case .preset(let type): return type.emoji
        case .other: return "🎯"
        }
    }
}
