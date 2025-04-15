//
//  ColorRanddom.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 10/4/25.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        Color(hue: Double.random(in: 0...1),
              saturation: 0.6,
              brightness: 0.9)
    }
}
