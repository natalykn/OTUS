//
//  NewsScreen.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import SwiftUI

import Networking
import TitleWithButton

struct CategoriesScreen: View {
    @Binding var show: Bool
    @ObservedObject var categoriesModel = CategoryModel()
    var body: some View {
        VStack{
            TitleWithButton(text: "News Categories:", buttonAction: {withAnimation(.easeInOut(duration: 1.0)) {
                self.show = false
            }})
            ListOfCategories(categories: categoriesModel.categories)
        }
        .padding()
        .background(.gray)
        .ignoresSafeArea()
        
    }
    
}

struct ListOfCategories: View {
    var categories:[CategoryInfo]
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
                Divider().frame(height: 5).background(.tertiary)
                ScrollView(.horizontal) {
                    HStack(spacing:10){
                        ForEach(categories) { category in
                            NewsCategoryCell(category: category)
                            Divider().frame(width: 5).background(.tertiary)
                        }
                    }.padding()
                }.frame(minHeight: 100, maxHeight: .infinity)
                
                Divider().frame(height: 5).background(.tertiary)
                Spacer()
            }
            .background(.gray)
        }
    }
}




