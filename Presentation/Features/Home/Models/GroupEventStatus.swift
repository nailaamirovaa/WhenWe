//
//  GroupEventStatus.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

enum GroupEventStatus {
    case confirmed
    case needsMore(Int)
    case waitlist

    var label: String {
        switch self {
        case .confirmed: return "Confirmed"
        case .needsMore(let count): return "Needs \(count)"
        case .waitlist: return "Waitlist"
        }
    }

    var tintColor: Color {
        switch self {
        case .confirmed: return AppColors.Semantic.going
        case .needsMore: return AppColors.Semantic.maybe
        case .waitlist: return AppColors.Brand.primary
        }
    }

    var ringColor: Color {
        switch self {
        case .confirmed: return AppColors.Brand.primary
        case .needsMore: return AppColors.Semantic.maybe
        case .waitlist: return AppColors.Brand.primary
        }
    }
}
