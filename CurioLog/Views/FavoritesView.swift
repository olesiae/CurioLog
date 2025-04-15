//
//  FavoritesView.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 11/4/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var favoriteFacts: [Fact] = FavoritesStorage.shared.load()
    @State private var showDeleteAllAlert = false

    var body: some View {
        NavigationView {
            VStack {
                if favoriteFacts.isEmpty {
                    Text("Not yet favorite facts...")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    List {
                        ForEach(favoriteFacts, id: \.self) { fact in
                            FactCardView(fact: fact)
                                .padding(.vertical, 8)
                        }
                        .onDelete(perform: deleteFact)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Favorite")
            .toolbar {
                if !favoriteFacts.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(role: .destructive) {
                            showDeleteAllAlert = true
                            //deleteAll()
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                    
                }
                
            }
            .alert("Delete all from favorites?", isPresented: $showDeleteAllAlert) {
                Button("Delete", role: .destructive) {
                    deleteAll()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This action cannot be undone. All favorite facts will be deleted.")
            }
            .onAppear {
                favoriteFacts = FavoritesStorage.shared.load()
            }
        }
    }

    private func deleteFact(at offsets: IndexSet) {
        offsets.forEach { index in
            let fact = favoriteFacts[index]
            FavoritesStorage.shared.remove(fact: fact)
        }
        favoriteFacts.remove(atOffsets: offsets)
    }

    private func deleteAll() {
        favoriteFacts.forEach {
            FavoritesStorage.shared.remove(fact: $0)
        }
        favoriteFacts.removeAll()
    }
    
    
}


#Preview {
    FavoritesView()
}
