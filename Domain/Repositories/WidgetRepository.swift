//
//  WidgetRepository.swift
//  WhenWe
//
//  Created by Naila Amirova on 31.07.26.
//

protocol WidgetRepository {
    func getNextEvent() async throws -> WidgetSnapshot
}

