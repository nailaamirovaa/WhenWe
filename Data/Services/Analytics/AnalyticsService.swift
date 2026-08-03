//
//  AnalyticsService.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

public final class AnalyticsService {
    
    static let shared = AnalyticsService()
    
    // MARK: - Ingest Batch
    
    func ingestBatch(request: AnalyticsBatchRequestDTO) async throws -> AnalyticsBatchResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: AnalyticsRequest.analyticsBatch(request),
                                                       responseType: AnalyticsBatchResponseDTO.self)
    }
    
    // MARK: - Ingest Event
    
    func ingestEvent(request: AnalyticsEventRequestDTO) async throws -> AnalyticsEventResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: AnalyticsRequest.analyticsEvent(request),
                                                       responseType: AnalyticsEventResponseDTO.self)
    }
}
