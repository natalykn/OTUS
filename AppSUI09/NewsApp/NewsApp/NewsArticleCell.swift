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
                    self.show = true
                }
            }
        if show {
            RoundedRectangle(cornerRadius: 15)
                .overlay(ReadUrlForm(show: $show, readUrl:article.url ))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                .shadow(color: .black, radius: 3)
                .zIndex(1)
        }

    }
    
}

struct NewsArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title:"Title", url: "https://www.google.com/")
        NewsArticleCell(article: article)
    }
}
