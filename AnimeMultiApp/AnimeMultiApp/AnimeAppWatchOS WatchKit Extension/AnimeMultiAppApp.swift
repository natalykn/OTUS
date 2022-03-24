//
//  AnimeMultiAppApp.swift
//  AnimeAppWatchOS WatchKit Extension
//
//  Created by Natalia Andryushina on 2022-03-24.
//

import SwiftUI

@main
struct AnimeMultiAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
