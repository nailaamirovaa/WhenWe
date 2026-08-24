//
//  AvailabilityService.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//


final class AvailabilityService {
    
    //MARK: - Get Availability
    func getMyAvailability() async throws -> [AvailabilityEntryResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: AvailabilityRequest.getMyAvailability,
                                                       responseType: [AvailabilityEntryResponseDTO].self)
    }

    //MARK: - Update Availability
    func updateMyAvailability(request: UpdateAvailabilityRequestDTO) async throws  -> [AvailabilityEntryResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: AvailabilityRequest.updateMyAvailability(request),
                                                       responseType: [AvailabilityEntryResponseDTO].self)
    }

    //MARK: - Get Overlap
    func getGroupOverlap(groupId: String) async throws -> [OverlapCellResponseDTO] {
        return try await NetworkManager.shared.request(apiRequest: AvailabilityRequest.getOverlap(groupId: groupId),
                                                       responseType: [OverlapCellResponseDTO].self)
    }
}
