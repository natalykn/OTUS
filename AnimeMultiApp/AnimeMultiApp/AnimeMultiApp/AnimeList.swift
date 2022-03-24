//
//  AnimeList.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import SwiftUI
import Network
import Networking

struct AnimeList: View {
    @StateObject var animeViewModel: AnimeViewModel = .init()
    @State var category: AnimeSearchQueryType
    @State var appeared: Double = 0
    
    var body: some View {
        animeViewModel.category = category
        animeViewModel.pageLoadByName(name: "Naruto")
#if os(tvOS)
        return ScrollView(.horizontal) {
            HStack() {
                ForEach(animeViewModel.animeList) { anime in
                    cell(anime: anime)
                }
            }
        }
        .frame(maxWidth: .greatestFiniteMagnitude)
        .navigationTitle(category.rawValue)
       
#else
        return  List(animeViewModel.animeList) { anime in
            // Cell
            cell(anime: anime)
        }
        .navigationTitle(category.rawValue)
#endif
    }
    
    func cell(anime: Anime) -> some View {
        VStack(alignment: .leading) {
            AnimeCell(anime: anime)
            if animeViewModel.isPageLoading && animeViewModel.animeList.isLast(anime) && animeViewModel.pagesInfo.hasNextPage == true {
                Divider()
                Text("Loading...")
            }
        }.onAppear {
            onItemShowed(anime)
        }
        
    }
    
}

extension AnimeList {
    
    func onItemShowed(_ anime: Anime) {
        // Load next page
        if (animeViewModel.animeList.isEmpty || animeViewModel.animeList.isLast(anime)) {
            animeViewModel.pageLoadByName(name: "Naruto")
        }
    }
    
}
