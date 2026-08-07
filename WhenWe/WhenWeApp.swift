//
//  WhenWeApp.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI
import GoogleSignIn

@main
struct WhenWeApp: App {

    @StateObject private var themeManager = ThemeManager()

    init() {
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(
            clientID: "498971098678-scpv2le433k07o0t8icpi97i2uag9hb4.apps.googleusercontent.com"
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.colorScheme)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
