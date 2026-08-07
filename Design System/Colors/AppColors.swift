//
//  AppColors.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

enum AppColors {

    enum Brand {
        static let primary = Color("BrandPrimary")
        static let primaryPressed = Color("BrandPrimaryPressed")
        static let soft = Color("BrandSoft")
        static let border = Color("BrandBorder")
    }

    enum Accent {
        static let energy = Color("AccentEnergy")
    }

    enum Semantic {
        static let going = Color("SemanticGoing")
        static let maybe = Color("SemanticMaybe")
        static let notGoing = Color("SemanticNotGoing")
    }

    enum Background {
        static let base = Color("BackgroundBase")
        static let subtle = Color("BackgroundSubtle")
        static let card = Color("BackgroundCard")
    }

    enum Text {
        static let primary = Color("TextPrimary")
        static let secondary = Color("TextSecondary")
        static let tertiary = Color("TextTertiary")
    }

    enum Border {
        static let `default` = Color("BorderDefault")

    }
    
    enum Custom {
        static let calendarCell = Color("calendarCell")
    }
}
