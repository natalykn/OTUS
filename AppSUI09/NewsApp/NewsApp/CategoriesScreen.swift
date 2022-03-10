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
    var hideButton: Bool
    var body: some View {
        VStack {
            TitleWithButton(text: "News Categories:",
                            hideButton: hideButton,
                            buttonAction: {withAnimation(.easeInOut(duration: 1.0)) {
                self.show = false
            }})
            ListOfCategories(categories: categoriesModel.categories)
            Spacer()
        }
        .padding()
        .ignoresSafeArea()
    }

}

struct ListOfCategories: View {
    var categories: [CategoryInfo]
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(categories) { category in
                            NewsCategoryCell(category: category)
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
