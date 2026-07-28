//
//  OverlapCellResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension OverlapCellResponseDTO {
    
    func toEntity() throws -> OverlapCell {
        
        guard let weekday = weekday else {
            throw MappingError.missingField("weekday")
        }
        
        guard let slot = slot else {
            throw MappingError.missingField("slot")
        }
        
        guard let freeCount = freeCount else {
            throw MappingError.missingField("freeCount")
        }
        
        guard let maybeCount = maybeCount else {
            throw MappingError.missingField("maybeCount")
        }
        
        guard let freeMembers = freeMembers else {
            throw MappingError.missingField("freeMembers")
        }
        
        guard let maybeMembers = maybeMembers else {
            throw MappingError.missingField("maybeMembers")
        }
        
        return OverlapCell(weekday: weekday,
                    slot: slot,
                    freeCount: freeCount,
                    maybeCount: maybeCount,
                    freeMembers: freeMembers,
                    maybeMembers: maybeMembers)
    }
}
