//
//  AppSUI01App.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

@main
struct AppSUI01App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SettingsViewModel())
        }
    }
}
