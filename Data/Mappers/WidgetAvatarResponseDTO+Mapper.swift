//
//  WidgetAvatarResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension WidgetAvatarResponseDTO {

    func toEntity() throws -> WidgetAvatar {

        guard let displayName = displayName else {
            throw MappingError.missingField("displayName")
        }

        return WidgetAvatar(displayName: displayName,
                            avatarUrl: avatarUrl)
    }
}
