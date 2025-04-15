//
//  ActivityView.swift
//  CurioLog
//
//  Created by Олеся Ефимова on 9/4/25.
//

import SwiftUI

struct  ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
#Preview {
    ActivityView(activityItems: ["Тестовый текст"])
}
