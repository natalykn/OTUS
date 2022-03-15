//
//  CategoriesScreen.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import SwiftUI

import Networking
import TitleWithButton

struct CategoriesScreen: View {
    @Binding var show: Bool
    @ObservedObject var categoriesModel = AnimeTypeModel()
    var hideButton: Bool
    
    var body: some View {
        VStack {
            TitleWithButton(text: "Anime search: Naruto",
                            hideButton: hideButton,
                            buttonAction: {withAnimation(.easeInOut(duration: 1.0)) {
                self.show = false
            }})
            Spacer()
            ListOfCategories(categories: categoriesModel.animeTypes)
            Spacer()
        }
        .padding()
        .ignoresSafeArea()
    }
    
}

struct ListOfCategories: View {
    var categories: [AnimeSearchQueryType]
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Please, select a category:")
                    .font(.title)

                Divider()
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(categories) { category in
                            AnimeTypeCell(animeType: category)
                            Divider().frame(width: 5).background(.tertiary)
                        }
                    }
                    .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
                }
                .frame(height: 100)
                .transition(.move(edge: .bottom))
                Divider()
                Spacer()
            }
            .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
            .background(.clear)
        }
    }
    
}
