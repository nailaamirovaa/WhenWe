//
//  UserDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 28.07.26.
//

extension AuthUserDTO {
    
    func toEntity() throws  -> User {
        
        guard let id = id else {
            throw MappingError.missingField("id")
        }
        
        guard let locale = locale else {
            throw MappingError.missingField("locale")
        }
        
        guard let timeZone = timeZone else {
            throw MappingError.missingField("timeZone")
        }
        
        guard let isPro = isPro else {
            throw MappingError.missingField("isPro")
        }
        
        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdat")
        }
        
        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }
        
        return User(id: id,
             locale: locale,
             timeZone: timeZone,
             isPro: isPro,
             createdAt: createdAt,
             updatedAt: updatedAt,
             appleUserId: appleUserId,
             googleUserId: googleUserId,
             fullName: fullName,
             avatarUrl: avatarUrl,
             deletedAt: deletedAt,
             counts: nil
        )
    }
}
