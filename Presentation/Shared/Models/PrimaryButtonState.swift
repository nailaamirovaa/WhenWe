//
//  PrimaryButtonState.swift
//  WhenWe
//
//  Created by Naila Amirova on 29.07.26.
//

import SwiftUI

enum PrimaryButtonState {
    case normal
    case pressed
    case disabled
    case loading
    
    var backgroundColor: Color {
        switch self {
        case .normal:
            return AppColors.Brand.primary
        case .pressed:
            return AppColors.Brand.primaryPressed
        case .disabled:
            return AppColors.Brand.primary.opacity(0.35)
        case .loading:
            return AppColors.Brand.primary
        }
    }
    
    var userInteractionEnabled: Bool {
        switch self {
        case .normal, .pressed:
            return true
        case .disabled, .loading:
            return false
        }
    }
    
    var textColor: Color {
        switch self {
        default:
            return .white
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .pressed: return 0.95
        default : return 1
        }
    }
    
    var showLoadingIndicator: Bool {
        self == .loading
    }
}

