//
//  FactCardView.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import SwiftUI

struct FactCardView: View {
    
    let fact: Fact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
            Text("💡 Amazing fact!")
                .font(.title2)
                .bold()
            
            Spacer()
            
                Image(systemName: fact.category.iconName)
                .font(.title3)
                .foregroundColor(.white)
                .padding(8)
                .background(fact.category.color)
                .clipShape(Circle())
        }
            
            Text(fact.text)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            HStack(spacing: 16) {
                
                if let source = fact.source,
                   let url = URL(string: source) {
                    HStack(spacing: 4) {
                        Image(systemName: "link")
                            .font(.footnote)
                        
                        Link("Info", destination: url)
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .underline()
                    }
                }
                Spacer()
                if let query = fact.text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let googleURL = URL(string: "https://www.google.com/search?q=\(query)") {
                    HStack{
                        Image(systemName: "globe")
                        Link("Search in Google", destination: googleURL)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
    
}
#Preview {
        FactCardView(fact: MockData.sampleFact)
    
}
