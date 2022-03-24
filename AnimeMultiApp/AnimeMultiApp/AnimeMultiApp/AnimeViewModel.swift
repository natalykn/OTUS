//
//  AnimeViewModel.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//

import Foundation

import Networking

extension Anime: Identifiable {
    public var id: Int {  malId }
}

final class AnimeViewModel: ObservableObject {
    @Published private(set) var animeList: [Anime] = .init()
    private(set) var pagesInfo : PaginationPagination = PaginationPagination()
    @Published var pageIndex: Int = 0
    @Published var isPageLoading: Bool = false
    var category: AnimeSearchQueryType = .tv{
        didSet(fromOldName) {
            if category != fromOldName {
                pageIndex = 0
                pagesInfo = PaginationPagination()
                self.animeList.removeAll()

            }
        }
    }
    
    func pageLoadByName(name:String) {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        pageIndex += 1

        DispatchQueue.global(qos: .background).async {
            if (self.pagesInfo.hasNextPage ?? true){
                AnimeAPI.getAnimeSearch(page: self.pageIndex, q: name, type:self.category, sort: .desc, completion: { data, error in
                    Task { @MainActor in
                        self.pagesInfo = data?.pagination ?? PaginationPagination()
                        print(error ?? "")
                        print(self.animeList)
                        self.animeList.append(contentsOf: data?.data ?? [])
                        self.isPageLoading = false
                    }
                })
            }
        }

    }

}
