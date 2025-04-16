//
//  FactViewModel.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 10/4/25.
//

import Foundation
import SwiftUI

@MainActor
final class FactViewModel: ObservableObject {
    @Published var fact: Fact? = nil
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var isFavorite = false
    
    private let predictor = FactCategoryPredictor()

    func loadRandomFact() async {
        isLoading = true
        errorMessage = nil

        do {
                var loadedFact = try await FactService.shared.fetchRandomFact()

                // Определяем категорию
                let predictedCategory = predictor.predictCategory(for: loadedFact.text)
                loadedFact.category = predictedCategory

                self.fact = loadedFact
                self.isFavorite = FavoritesStorage.shared.isFavorite(loadedFact)
            } catch {
                self.errorMessage = error.localizedDescription
            }

        isLoading = false
    }
    
    func toggleFavorite() {
            guard let fact = fact else { return }

            if isFavorite {
                FavoritesStorage.shared.remove(fact: fact)
            } else {
                FavoritesStorage.shared.save(fact: fact)
            }

            isFavorite.toggle()
        }
}
