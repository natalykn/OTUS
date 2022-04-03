//
//  ContentView.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-01-08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ServicesModel()

    @State var name:String = ""
    @State private var isPresentedPlaylistView = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                NavigationLink(destination: Playlist().environmentObject(model),
                               isActive: $isPresentedPlaylistView) { EmptyView()}
                TextField("Name", text: $name)
                    .autocapitalization(.none)
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.all)
                HStack {
                    Spacer()
                    Button("Log in") {
                        if !name.isEmpty {
                            model.loginAndLoadPlaylist(login: name)
                            isPresentedPlaylistView = true
                        }
                    }
                    Spacer()
                    Button("Log out") {
                        name = ""
                        model.clear()
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
