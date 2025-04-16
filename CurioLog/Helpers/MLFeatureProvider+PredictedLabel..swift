//
//  MLFeatureProvider+PredictedLabel..swift
//  CurioLog
//
//  Created by Олеся Ефимова on 15/4/25.
//

import Foundation
import CoreML

extension MLFeatureProvider {
    var predictedLabel: String? {
        // Самые частые ключи для предсказания
        let possibleKeys = ["label", "category", "classLabel", "predictedLabel"]

        for key in possibleKeys {
            if let value = self.featureValue(for: key)?.stringValue {
                return value
            }
        }

        return nil
    }
}
