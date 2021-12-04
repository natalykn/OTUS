//
//  ContentView.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

enum Tab {
    case catalog
    case home
    case settings
}

class TabController: ObservableObject {
    @Published var activeTab = Tab.catalog

    func open(_ tab: Tab) {
        activeTab = tab
    }
}

struct ContentView: View {
    @StateObject private var tabController = TabController()
    @State var selectedItem: Int?

    var body: some View {
        
        TabView(selection: $tabController.activeTab) {
            CatalogScreen(selection:$tabController.activeTab, selectedItem: $selectedItem)
                .tabItem {
                    Label("Catalog", systemImage: "folder")
                }
                .tag(Tab.catalog)

            HomeScreen(selectedItem: $selectedItem)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(Tab.settings)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
