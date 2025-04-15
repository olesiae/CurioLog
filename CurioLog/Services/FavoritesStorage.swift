//
//  FavoritesStorage.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import Foundation
final class FavoritesStorage {
    static let shared = FavoritesStorage()

    private let key = "favoriteFacts"
    private let defaults = UserDefaults.standard

    private init() {}

    func save(fact: Fact) {
        var current = load()
        if !current.contains(fact) {
            current.append(fact)
            store(current)
        }
    }

    func remove(fact: Fact) {
        var current = load()
        current.removeAll { $0.text == fact.text } // сравнение по тексту
        store(current)
    }

    func load() -> [Fact] {
        guard let data = defaults.data(forKey: key) else { return [] }
        do {
            let decoded = try JSONDecoder().decode([Fact].self, from: data)
            return decoded
        } catch {
            print("Error при загрузке избранного: \(error)")
            return []
        }
    }

    func isFavorite(_ fact: Fact) -> Bool {
        return load().contains(where: { $0.text == fact.text })
    }

    private func store(_ facts: [Fact]) {
        do {
            let data = try JSONEncoder().encode(facts)
            defaults.set(data, forKey: key)
        } catch {
            print("Error при сохранении избранного: \(error)")
        }
    }
}
