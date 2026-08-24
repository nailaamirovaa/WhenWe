//
//  AvailabilityCellState.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.08.26.
//

import SwiftUI

enum AvailabilityCellState: String, CaseIterable {
    case free
    case maybe
    case busy
    
    var title: String {
        switch self {
        case .free:
            return "Free"
        case .maybe:
            return "Maybe"
        case .busy:
            return "Busy"
        }
    }
    var color: Color {
        switch self {
        case .free:
            return AppColors.Brand.primary
        case .maybe:
            return AppColors.Brand.primaryPressed.opacity(0.5)
        case .busy:
            return AppColors.Brand.soft
        }
    }
    
    var next: AvailabilityCellState {
        switch self {
        case .busy: return .maybe
        case .maybe: return .free
        case .free: return .busy
        }
    }

    var restrictiveness: Int {
        switch self {
        case .free: return 0
        case .maybe: return 1
        case .busy: return 2
        }
    }
}

