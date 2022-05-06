//
//  HomeView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var fungiRepository: FungiRepository
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { fungi in
                    FungiShortInfo(fungi: fungi)
                        .padding([.leading, .trailing])
                }                .listRowBackground(mainColors1)
                
            }
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result.name)?").searchCompletion(result.name)
                }
            }
            .navigationTitle("Fungies")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(.bottom, 80)
        
        .edgesIgnoringSafeArea(.all)
    }
    
    var searchResults: [Fungi] {
        if searchText.isEmpty {
            return fungiRepository.fungies
        } else {
            return fungiRepository.fungies.filter { $0.name.contains(searchText) }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
