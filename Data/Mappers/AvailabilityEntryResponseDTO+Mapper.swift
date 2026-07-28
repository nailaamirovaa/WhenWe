//
//  AvailabilityEntryResponseDTO|+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//


extension AvailabilityEntryResponseDTO {
    
    func toEntity() throws -> AvailabilityEntry {
        
        guard let weekday = weekday else {
            throw MappingError.missingField("weekday")
        }
        
        guard let slot = slot else {
            throw MappingError.missingField("slot")
        }
        
        guard let state = state else {
            throw MappingError.missingField("state")
        }
        
        return AvailabilityEntry(weekday: weekday,
                          slot: slot,
                          state: state)
    }
}
