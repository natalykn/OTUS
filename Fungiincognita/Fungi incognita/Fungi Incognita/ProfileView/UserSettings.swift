//
//  UserSettings.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI

import Foundation

enum DefaultSettings {
    // Color Slider Values
    static var rValue: Double = 41.0
    static var gValue: Double = 152.0
    static var bValue: Double = 116.0

    // Profile
    static var name: String = "Name"
    static var description: String = """
What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
 when an unknown printer took a galley of type and scrambled it to make
 a type specimen book. It has survived not only five centuries,
but also the leap into electronic typesetting, remaining essentially unchanged.
It was popularised in the 1960s with the release
of Letraset sheets containing Lorem Ipsum passages,
and more recently with desktop publishing
software like Aldus PageMaker including versions of Lorem Ipsum.
"""
    static var profileUrl: URL = URL(fileURLWithPath: "")

    static var favorites: [String] = []

}

// final class UserOptions {
//    var colorArray = [
//        ColorSetting(id: 0, name: "Yellow", color: .yellow),
//        ColorSetting(id: 1, name: "Orange", color: .orange),
//        ColorSetting(id: 2, name: "Red", color: .red),
//        ColorSetting(id: 3, name: "Mint", color: .mint),
//        ColorSetting(id: 4, name: "Teal", color: .teal),
//        ColorSetting(id: 5, name: "Cyan", color: .cyan),
//        ColorSetting(id: 6, name: "Blue", color: .blue),
//        ColorSetting(id: 7, name: "Purple", color: .purple),
//        ColorSetting(id: 8, name: "Indigo", color: .indigo),
//        ColorSetting(id: 9, name: "Brown", color: .brown),
//        ColorSetting(id: 10, name: "Green", color: .green)
//    ]
// }
//
// struct ColorSetting:Identifiable {
//    var id: Int
//    var name: String
//    var color: Color
// }
