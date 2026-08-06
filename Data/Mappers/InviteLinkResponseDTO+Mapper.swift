//
//  InviteLinkResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 05.08.26.
//

extension InviteLinkResponseDTO {
    
    func toEntity() throws  -> InviteLink {
        
        guard let inviteUrl = inviteUrl else {
            throw MappingError.missingField("inviteUrl")
        }
        
        guard let inviteCode = inviteCode else {
            throw MappingError.missingField("inviteCode")
        }
        
        return InviteLink(inviteCode: inviteCode,
                   inviteURL: inviteUrl)
    }
}
