//
//  FungiIncognitaApp.swift
//  Fungi incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI
import Firebase
import FirebaseAppCheck

@main
struct FungiIncognitaApp: App {
    @StateObject var fungiRepository = FungiRepository()

    init() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        FirebaseApp.configure()
        AuthenticationService.signIn()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(fungiRepository)
        }
    }
}
