//
//  FactOfTheDayView.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import SwiftUI

struct FactOfTheDayView: View {
    
    @StateObject private var viewModel = FactViewModel()
    @State private var isFavorite = false
    @State private var showShareSheet = false
    @State private var gradientColors: [Color] = [.blue, .purple]
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 1.0), value: gradientColors)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    if viewModel.isLoading {
                        ProgressView("Loading fact...")
                    } else if let fact = viewModel.fact {
                        FactCardView(fact: fact)
                            .frame(maxWidth: .infinity)
                        
                        HStack(spacing: 30) {
                            Button {
                                Task {
                                    await viewModel.loadRandomFact()
                                    updateGradient()
                                }
                                
                            } label: {
                                Label("New fact", systemImage: "arrow.triangle.2.circlepath")
                            }
                            
                            Button {
                                viewModel.toggleFavorite()
                                } label: {
                                    Label("Favorite", systemImage: viewModel.isFavorite ? "heart.fill" : "heart")
                                        .foregroundColor(viewModel.isFavorite ? .red : .primary)
                            }
                            
                            Button {
                                showShareSheet.toggle()
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .sheet(isPresented: $showShareSheet) {
                                if let factText = viewModel.fact?.text {
                                    ActivityView(activityItems: [factText])
                                }
                                
                            }
                            
                        }
                        .font(.headline)
                        .foregroundColor( .primary)
                        Spacer()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    }
                    Spacer()
                }
                
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
                .navigationTitle("Did you know...?")
                .background(Color(hue: 0.561, saturation: 0.574, brightness: 0.958, opacity: 0.905))
                .task {
                    await viewModel.loadRandomFact()
                    updateGradient()
                }
                
                .edgesIgnoringSafeArea(.bottom)
                .preferredColorScheme(.dark)
                
            }
            
        }
    private func updateGradient() {
            gradientColors = [
                .random(),
                .random()
            ]
        }
        }
    


#Preview {
    FactOfTheDayView()
}

