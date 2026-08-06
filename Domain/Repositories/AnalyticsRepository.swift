//
//  AnalyticsRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol AnalyticsRepository {
    func track(name: String, props: [String: JSONValue]?, clientTimestamp: String) async throws
    func trackBatch(_ events: [AnalyticsEventRequestDTO]) async throws
}
