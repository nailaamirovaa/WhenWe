//
//  RefreshTokenResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension RefreshTokenResponseDTO {

    func toEntity() throws -> AuthTokens {

        guard let accessToken = accessToken else {
            throw MappingError.missingField("accessToken")
        }

        guard let refreshToken = refreshToken else {
            throw MappingError.missingField("refreshToken")
        }

        guard let expiresIn = expiresIn else {
            throw MappingError.missingField("expiresIn")
        }

        return AuthTokens(accessToken: accessToken,
                          refreshToken: refreshToken,
                          expiresIn: expiresIn)
    }
}
