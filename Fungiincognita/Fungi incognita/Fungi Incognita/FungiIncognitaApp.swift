//
//  FungiIncognitaApp.swift
//  Fungi incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI
import Firebase

@main
struct FungiIncognitaApp: App {

    init() {
     FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
