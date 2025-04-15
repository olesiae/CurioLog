//
//  FactService.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import Foundation

final class FactService {
    static let shared = FactService()
    private init() {}

    private let baseURL = "https://uselessfacts.jsph.pl/api/v2/facts/random?language=en"

    func fetchRandomFact() async throws -> Fact {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        let rawFact = try decoder.decode(Fact.self, from: data)
        return rawFact
    }
}
