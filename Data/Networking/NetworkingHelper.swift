//
//  NetworkingHelper.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

enum NetworkingHelper {
    static let baseURL = "http://localhost:3000/api/v1"
    
    static let defaultHeaders: [String: String] = [
        "Content-Type": "application/json",
        "Accept":       "application/json"
    ]
}
