//
//  Main.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI

struct Main: View {
    @State private var show = false
    @State private var currentSubviewIndex = 0
    @State private var showingSubview = false
    @State var selection = 0
    
    private var content : some View{
        TabView(selection: $selection) {
            About()
                .tag(0)
                .tabItem {
                    Label(title: { Text("About").font(.title) }, icon: { Image(systemName: "info") })
                }
            CategoriesScreen(show: $show, hideButton: true)
                .tag(1)
                .tabItem {
                    Label(title: { Text("Catalog").font(.title) }, icon: { Image(systemName: "eyeglasses") })
                }
            
        }
    }
    var body: some View {
#if os(watchOS)
        AnimeList(category: .movie)
#elseif !targetEnvironment(macCatalyst)
        NavigationView{
            content
        }
#else
        content
#endif
    }
}



struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
