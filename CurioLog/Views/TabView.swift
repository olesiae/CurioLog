//
//  TabView.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 11/4/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FactOfTheDayView()
                .tabItem {
                    Label("Fact", systemImage: "lightbulb")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
        }
    }
}

#Preview {
    MainView()
}
