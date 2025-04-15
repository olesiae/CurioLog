//
//  Fact.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import Foundation

struct Fact: Identifiable, Codable, Hashable {
    
    let id: UUID? = UUID()
    let text: String
    let source: String?
    let language:String
    var category: FactCategory = .weird
    var imageUrl: URL? = nil
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case source = "source_url"
        case language = "language"
        
    }
}
