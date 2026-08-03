//
//  AuthSessionManager.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Combine
import Foundation

final class AuthSessionManager: ObservableObject {
    static let shared = AuthSessionManager()
    
    @Published private(set) var isAuthenticated = false
    
    private let accessTokenKey = "com.whenwe.accessToken"
    private let refreshTokenKey = "com.whenwe.refreshToken"
    
    private init() {
        isAuthenticated = accessToken != nil
    }
    
    private(set) var accessToken: String? {
        get { UserDefaults.standard.string(forKey: accessTokenKey) }
        set {
            UserDefaults.standard.set(newValue, forKey: accessTokenKey)
            isAuthenticated = newValue != nil
        }
    }
    
    private(set) var refreshToken: String? {
        get { UserDefaults.standard.string(forKey: refreshTokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: refreshTokenKey) }
    }
    
    func save(_ tokens: AuthTokens) {
        accessToken = tokens.accessToken
        refreshToken = tokens.refreshToken
    }
    
    func clear() {
        accessToken = nil
        refreshToken = nil
    }
}
