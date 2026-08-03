//
//  NetworkManager.swift
//  WhenWe
//
//  Created by Naila Amirova on 03.08.26.
//

import Foundation

final class NetworkManager: Sendable {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - Shared plumbing
    private func execute(_ apiRequest: APIRequest) async throws -> Data {
        var components = URLComponents(string: NetworkingHelper.baseURL + apiRequest.path)
        components?.queryItems = apiRequest.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.method.rawValue
        request.httpBody = apiRequest.body

        NetworkingHelper.defaultHeaders.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        apiRequest.headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200...299 ~= httpResponse.statusCode else {
            if let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                throw NetworkError.apiError(message: apiError.error?.message ?? "Server error",
                                            code: apiError.error?.code)
            }
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        return data
    }

    // MARK: - When we expect a decodable response
    func request<T: Decodable>(apiRequest: APIRequest, responseType: T.Type) async throws -> T {
        let data = try await execute(apiRequest)
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

    // MARK: - When there's nothing to decode
    func requestVoid(apiRequest: APIRequest) async throws {
        _ = try await execute(apiRequest)
    }
}
