//
//  Category.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import Foundation
import SwiftUI

enum FactCategory: String, CaseIterable, Codable, Hashable, Identifiable {
    case science, history, animals, space, humans, food, weird, tech, numbers

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .science: return "Science"
        case .history: return "History"
        case .animals: return "Animals"
        case .space: return "Space"
        case .humans: return "Humans"
        case .food: return "Food"
        case .weird: return "Weird"
        case .tech: return "Tech"
        case .numbers: return "Numbers"
        }
    }

    var iconName: String {
        switch self {
        case .science: return "atom"
        case .history: return "book.closed"
        case .animals: return "pawprint"
        case .space: return "sparkles"
        case .humans: return "person.crop.circle"
        case .food: return "fork.knife"
        case .weird: return "questionmark.circle"
        case .tech: return "cpu"
        case .numbers: return "number.circle"
        }
    }
}

extension FactCategory {
    var color: Color {
        switch self {
        case .science: return .green
        case .history: return .brown
        case .animals: return .orange
        case .space: return .indigo
        case .humans: return .pink
        case .food: return .red
        case .weird: return .purple
        case .tech: return .blue
        case .numbers: return .teal
        }
    }
}
