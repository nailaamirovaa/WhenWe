//
//  AvailabilityRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

final class AvailabilityRepositoryImplementation: AvailabilityRepository {
    
    private let service: AvailabilityService
    
    init(service: AvailabilityService) {
        self.service = service
    }
    
    //MARK: - Get My Availability
    func getMyAvailability() async throws -> [AvailabilityEntry] {
        let dto = try await service.getMyAvailability()
        
        return try [dto.toEntity()]
    }
    
    //MARK: - Update My Availability
    func updateMyAvailability(entries: [AvailabilityEntryRequestDTO]) async throws -> [AvailabilityEntry] {
        let dto = try await service.updateMyAvailability(request: UpdateAvailabilityRequestDTO(entries: entries))
        
        return try [dto.toEntity()]
    }
    
    //MARK: - Get Group Overlap
    func getGroupOverlapHeatmap(groupId: String) async throws -> [OverlapCell] {
        let dto = try await service.getGroupOverlap(groupId: groupId)
        
        return try [dto.toEntity()]
    }
}
