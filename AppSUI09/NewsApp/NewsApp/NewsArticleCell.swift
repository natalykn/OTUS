//
//  NewsArticleCell.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import Networking

struct NewsArticleCell: View {
    @Environment(\.openURL) var openURL
    @State private var show = false

    var article: Article
    var body: some View {
        Text(article.title ?? "")
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.8)) {
                    openURL(URL(string: article.url)!)

                }
            }
            .padding()
    }

}

struct NewsArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "Title", url: "https://www.google.com/")
        NewsArticleCell(article: article)
    }
}
