//
//  JoinPreviewResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension JoinPreviewResponseDTO {
    
    func toEntity() throws -> JoinPreview {
        
        guard let id = id else {
            throw MappingError.missingField("id")
        }
        
        guard let name = name else {
            throw MappingError.missingField("name")
        }
        
        guard let emoji = emoji else {
            throw MappingError.missingField("emoji")
        }
        
        guard let activityType = activityType else {
            throw MappingError.missingField("activityType")
        }
        
        guard let memberCount = memberCount else {
            throw MappingError.missingField("memberCount")
        }
        
        return JoinPreview(id: id,
                           name: name,
                           emoji: emoji,
                           activityType: activityType,
                           memberCount: memberCount)
    }
}
