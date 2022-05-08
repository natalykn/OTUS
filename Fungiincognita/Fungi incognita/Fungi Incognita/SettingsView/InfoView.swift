//
//  SettingsView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: About()) {
                    VStack(alignment: .leading) {
                        Text("About")
                    }
                }
                NavigationLink(destination: Help()) {
                    VStack(alignment: .leading) {
                        Text("Help")
                    }
                }
            }
            .navigationBarTitle("Info")
            VStack(alignment: .leading) {}
                .frame(height: 80)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
