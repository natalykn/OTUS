//
//  CoreMLApp.swift
//  CoreMLApp
//
//  Created by Natalia Andryushina on 2022-04-03.
//

import SwiftUI

@main
struct CoreMLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
