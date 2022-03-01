//
//  NewsList.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import SwiftUI
import Network
import Networking

struct NewsList: View {
    @StateObject var newsViewModel: NewsViewModel = .init()
    @State var category: String
    @State var appeared: Double = 0

    var body: some View {
        VStack{
            Text("Category: \(category)")
                .font(.body)
                .frame(height:20 , alignment: .center)
            Spacer()
            List {
                ForEach(newsViewModel.articles) { article in
                    NewsArticleCell(article: article)
                }
            }
            .onAppear {
                newsViewModel.loadNewsByCategory(category: category)
                self.appeared = 1.0
            }
            .onDisappear {self.appeared = 0.0}
            .opacity(appeared)
            .animation(Animation.easeInOut(duration: 5.0), value: appeared)
            .listStyle(.plain)
            Spacer()
        }
    }
}


struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList(category: "sports")
    }
}
