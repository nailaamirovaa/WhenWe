//
//  ThemeManager.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI
import Combine

final class ThemeManager: ObservableObject {

    @Published var colorScheme: ColorScheme? = nil

    func toggleTheme() {
        colorScheme = (colorScheme == .dark) ? .light : .dark
    }
}
