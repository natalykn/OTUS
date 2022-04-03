//
//  InjectedWrapperApp.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-01-08.
//

import SwiftUI

@main
struct InjectedWrapperApp: App {
    init() {
        Configurator.shared.register()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
