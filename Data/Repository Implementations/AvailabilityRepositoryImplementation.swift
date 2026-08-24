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
        let dtos = try await service.getMyAvailability()

        return try dtos.map { try $0.toEntity() }
    }

    //MARK: - Update My Availability
    func updateMyAvailability(entries: [AvailabilityEntryRequestDTO]) async throws -> [AvailabilityEntry] {
        let dtos = try await service.updateMyAvailability(request: UpdateAvailabilityRequestDTO(entries: entries))

        return try dtos.map { try $0.toEntity() }
    }

    //MARK: - Get Group Overlap
    func getGroupOverlapHeatmap(groupId: String) async throws -> [OverlapCell] {
        let dtos = try await service.getGroupOverlap(groupId: groupId)

        return try dtos.map { try $0.toEntity() }
    }
}
