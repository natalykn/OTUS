//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import Foundation

import Networking

extension Article: Identifiable {
    public var id: String { url }
}

final class NewsViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    
    init() {}
    
    func loadNewsByCategory(category:String) {
        DispatchQueue.global(qos: .background).async {
            DataAPI.newsGet(category: category) { list, error in
                Task { @MainActor in
                    self.articles.removeAll()
                    self.articles.append(contentsOf: list?.data ?? [])
                }
            }
        }
    }
    
    
}
