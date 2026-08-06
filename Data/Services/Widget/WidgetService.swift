//
//  WidgetService.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class WidgetService {

    // MARK: - Get Next Event
    func getNextEvent() async throws -> WidgetNextResponseDTO {
        return try await NetworkManager.shared.request(apiRequest: WidgetRequest.getNextEvent, responseType: WidgetNextResponseDTO.self)
    }
}
