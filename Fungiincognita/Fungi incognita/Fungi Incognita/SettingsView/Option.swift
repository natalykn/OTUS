//
//  Option.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI
import Combine

struct Option: Codable {
    var id: Int
    var title: String
    var isAddSection: Bool
    var values: [InnerOptionValues]
}

struct InnerOptionValues: Codable {
    var title: String
    var isAddSection: Bool
    var isUseToggle: Bool
    var headerTitle: String
}

extension Option {
    static let generalValues: [InnerOptionValues] = [
        .init(title: "About", isAddSection: true, isUseToggle: false, headerTitle: ""),
        .init(title: "Fonts", isAddSection: false, isUseToggle: false, headerTitle: ""),
        .init(title: "Language & Region", isAddSection: false, isUseToggle: false, headerTitle: ""),
        .init(title: "Reset", isAddSection: true, isUseToggle: false, headerTitle: "")
    ]

    static let accessibilityValues: [InnerOptionValues] = [
        .init(title: "Face ID & Attention", isAddSection: false, isUseToggle: false, headerTitle: "")
    ]

    static let privacyValues: [InnerOptionValues] = [
        .init(title: "Location", isAddSection: true, isUseToggle: true, headerTitle: "ENABLE TO ACCESS LOCATION"),
        .init(title: "Photos", isAddSection: false, isUseToggle: false, headerTitle: ""),
        .init(title: "Camera", isAddSection: false, isUseToggle: false, headerTitle: "")
    ]

    static let options: [Option] = [
        .init(id: 1, title: "General", isAddSection: false, values: generalValues),
        .init(id: 2, title: "Accessibility", isAddSection: false, values: accessibilityValues),
        .init(id: 3, title: "Privacy", isAddSection: false, values: privacyValues)
    ]
}
