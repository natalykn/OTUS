//
//  SettingsScreen.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

struct SettingsScreen: View {
    
    var body: some View {
        NavigationView() {
            SettingsListView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsListView: View {
    
    @State private var showingTask = false

    var body: some View {
        Button("Show Task") {
            showingTask.toggle()
        }
        .sheet(isPresented: $showingTask) {
            TaskScreen()
        }
    }
}


struct SettingsScreenScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
