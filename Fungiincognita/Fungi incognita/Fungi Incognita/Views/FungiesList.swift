//
//  HomeView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct FungiesList: View {
    @EnvironmentObject var fungiRepository: FungiRepository
    @SceneStorage("searchText") private var searchText = ""
    var onlyFavorities: Bool
    var body: some View {
        NavigationView {
            List {
                ForEach(fungiRepository.searchResults(searchText: searchText,
                                                      onlyFavorites: onlyFavorities), id: \.self) { fungi in
                    FungiShortInfo(fungi: fungi)
                        .environmentObject(fungiRepository)
                        .listRowSeparator(.hidden)
                }.listRowBackground(mainColors1)
            }
            .searchable(text: $searchText) {
                ForEach(fungiRepository.searchResults(searchText: searchText,
                                                      onlyFavorites: onlyFavorities), id: \.self) { result in
                    Text("Are you looking for \(result.name)?").searchCompletion(result.name)
                }
            }
            .navigationTitle("Fungies")

        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(.bottom, 80)
        .edgesIgnoringSafeArea(.all)
    }
}
