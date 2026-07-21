//
//  RSVPChoice.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

enum RSVPChoice: CaseIterable {

    case going
    case maybe
    case cant

    var title: String {
        switch self {
        case .going: return "Going ✅"
        case .maybe: return "Maybe"
        case .cant: return "Can't 😞"
        }
    }

    var color: Color {
        switch self {
        case .going: return AppColors.Semantic.going
        case .maybe: return AppColors.Semantic.maybe
        case .cant: return AppColors.Semantic.notGoing
        }
    }
}
