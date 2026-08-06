//
//  PushDeviceResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension PushDeviceResponseDTO {

    func toEntity() throws -> PushDevice {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let userId = userId else {
            throw MappingError.missingField("userId")
        }

        guard let apnsToken = apnsToken else {
            throw MappingError.missingField("apnsToken")
        }

        guard let bundleEnv = bundleEnv else {
            throw MappingError.missingField("bundleEnv")
        }

        guard let deviceId = deviceId else {
            throw MappingError.missingField("deviceId")
        }

        guard let lastSeenAt = lastSeenAt else {
            throw MappingError.missingField("lastSeenAt")
        }

        guard let active = active else {
            throw MappingError.missingField("active")
        }

        guard let createdAt = createdAt else {
            throw MappingError.missingField("createdAt")
        }

        guard let updatedAt = updatedAt else {
            throw MappingError.missingField("updatedAt")
        }

        return PushDevice(id: id,
                          userId: userId,
                          apnsToken: apnsToken,
                          bundleEnv: bundleEnv,
                          deviceId: deviceId,
                          lastSeenAt: lastSeenAt,
                          active: active,
                          createdAt: createdAt,
                          updatedAt: updatedAt)
    }
}
