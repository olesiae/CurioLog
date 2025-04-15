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

    func loadRandomFact() async {
        isLoading = true
        errorMessage = nil

        do {
            let loadedFact = try await FactService.shared.fetchRandomFact()
            self.fact = loadedFact
            self.isFavorite = FavoritesStorage.shared.isFavorite(loadedFact)
            
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error loadind a fact: \(error.localizedDescription)")
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
