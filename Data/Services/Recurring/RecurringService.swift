//
//  RecurringService.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class RecurringService {
    
    //MARK: - Create Recurring Series
    func createRecurringSeries(groupId: String, request: CreateRecurringRequestDTO) async throws -> RecurringSeriesResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: RecurringRequest.createRecurringSeries(groupId: groupId, request),responseType: RecurringSeriesResponseDTO.self)
    }
    
    //MARK: - Get Recurring Series
    func getRecurringSeries(recurringId: String) async throws -> RecurringSeriesResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: RecurringRequest.getRecurringSeries(recurringId: recurringId), responseType: RecurringSeriesResponseDTO.self)
    }
    
    //MARK: - Update Recurring Series
    func updateRecurringSeries(recurringId: String, request: UpdateRecurringRequestDTO) async throws -> RecurringSeriesResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: RecurringRequest.updateRecurringSeries(recurringId: recurringId, request),
                                                       responseType: RecurringSeriesResponseDTO.self)
    }
    
    //MARK: - Stop Recurring Series
    func stopRecurringSeries(recurringId: String) async throws  {
        return try await NetworkManager.shared.requestVoid(apiRequest: RecurringRequest.stopRecurringSeries(recurringId: recurringId))
    }
}
