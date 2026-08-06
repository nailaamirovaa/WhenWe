//
//  WidgetRepositoryImplementation.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

final class WidgetRepositoryImplementation: WidgetRepository {

    private let service: WidgetService

    init(service: WidgetService) {
        self.service = service
    }

    //MARK: - Get Next Event
    func getNextEvent() async throws -> WidgetSnapshot {
        let dto = try await service.getNextEvent()
        return try dto.toEntity()
    }
}
