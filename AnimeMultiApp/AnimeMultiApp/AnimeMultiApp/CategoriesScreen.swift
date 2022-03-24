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
        VStack (alignment: .center){
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
        
        VStack (){
            Text("Please, select a category:")
                .font(.title)
            
            Divider()
#if os(tvOS)
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(categories) { category in
                        AnimeTypeCell(animeType: category)
                    }
                }
                .padding()
            }
            .transition(.move(edge: .bottom))
#else
            NavigationView{
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(categories) { category in
                            AnimeTypeCell(animeType: category)
                            Divider().frame(height: 5).background(.tertiary)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude)
                }
            }
            .transition(.move(edge: .bottom))
            Divider()
            Spacer()
#endif
            
        }
        .background(.clear)
    }
    
}
