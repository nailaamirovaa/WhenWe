//
//  CreateEventError.swift
//  WhenWe
//
//  Created by Naila Amirova on 17.08.26.
//

import Foundation

enum CreateEventError: LocalizedError {
    case noGroupSelected

    var errorDescription: String? {
        switch self {
        case .noGroupSelected: return "Please select a group"
        }
    }
}
