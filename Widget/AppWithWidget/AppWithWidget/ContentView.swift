//
//  ContentView.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-03-28.
//

import SwiftUI

struct ContentView: View {
    
    @State var linkOne: Bool = false
    @State var linkTwo: Bool = false
    @State var linkThree: Bool = false
    @State var activeTab = TabIdentifier.newText
    @ObservedObject var suffixModel = SuffixModel()

    var body: some View {
        TabView(selection: $activeTab) {
            MainView()
                .environmentObject(suffixModel)
                .tabItem {
                    Image(systemName: "text.magnifyingglass")
                    Text("New text")
                }
                .tag(TabIdentifier.newText)
            History()
                .environmentObject(suffixModel)
                .tabItem {
                    Image(systemName: "square.fill.text.grid.1x2")
                    Text("History")
                }
                .tag(TabIdentifier.history)
        }
        .onOpenURL { url in
            guard let tabIdentifier = url.tabIdentifier else {
                return
            }
            activeTab = tabIdentifier
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
