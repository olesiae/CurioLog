import Foundation

final class FavoritesStorage {
    static let shared = FavoritesStorage()

    private let key = "favoriteFacts"
    private let defaults = UserDefaults.standard
    private let predictor = FactCategoryPredictor()

    private init() {}

    func save(fact: Fact) {
        
        var factToSave = fact
        if factToSave.category == .weird {
            let predicted = predictor.predictCategory(for: factToSave.text)
            factToSave.category = predicted
            
        }

        var current = load()
        //  Сохраняем
        if !current.contains(factToSave) {
            current.append(factToSave)
            store(current)
            
        }
    }

    func remove(fact: Fact) {
        var current = load()
        current.removeAll { $0.text == fact.text }
        store(current)
    }

    func load() -> [Fact] {
        guard let data = defaults.data(forKey: key) else { return [] }
        do {
            let decoded = try JSONDecoder().decode([Fact].self, from: data)
            return decoded
        } catch {
            print("Error loading favorites: \(error)")
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
            print("Error saving favorites: \(error.localizedDescription)")
        }
    }
}
