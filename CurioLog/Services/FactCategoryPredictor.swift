//
//  FactCategoryPredictor.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 15/4/25.
//

import Foundation
import CoreML

final class FactCategoryPredictor {
    private let model: MyTextClassifier_cat2
    
    init() {
            do {
                model = try MyTextClassifier_cat2(configuration: MLModelConfiguration())
                //print(" Модель загружена")
            } catch {
                fatalError("Не удалось загрузить ML-модель: \(error)")
            }
        }

    func predictCategory(for text: String) -> FactCategory {
        do {
            let prediction = try model.prediction(text: text)
            let label = prediction.predictedLabel ?? "weird"
        
            return FactCategory(rawValue: label) ?? .weird
        } catch {
            print("Error in prediction: \(error)")
            return .weird
        }
    }
}

