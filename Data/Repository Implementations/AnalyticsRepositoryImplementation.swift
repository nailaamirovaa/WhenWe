//
//  AnalyticsRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class AnalyticsRepositoryImplementation: AnalyticsRepository {

    private let service: AnalyticsService
    
    init(service: AnalyticsService) {
        self.service = service
    }
    
    //MARK: - Track Event
    func track(name: String, props: [String : JSONValue]?, clientTimestamp: String) async throws {
        _ = try await service.ingestEvent(request: AnalyticsEventRequestDTO(name: name, props: props, clientTs: clientTimestamp))
    }
    
    //MARK: - Track Batch
    func trackBatch(_ events: [AnalyticsEventRequestDTO]) async throws {
        _ = try await service.ingestBatch(request: AnalyticsBatchRequestDTO(events: events))
    }
}
