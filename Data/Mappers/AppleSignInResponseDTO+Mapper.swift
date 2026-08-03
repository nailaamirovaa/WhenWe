//
//  AppleSignInResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

extension AppleSignInResponseDTO {
    
    func toEntity() throws -> AuthResult {
        
        guard let isNew = isNew else {
            throw MappingError.missingField("isNew")
        }
        
        guard let user = user else {
            throw MappingError.missingField("user")
        }
        
        return AuthResult(isNew: isNew,
                   user: try user.toEntity())
    }
}
