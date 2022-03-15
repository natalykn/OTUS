//
//  CategoryModel.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//
import Foundation
import Networking

extension AnimeSearchQueryType: Identifiable {
    public var id: Self { self }
}


final class AnimeTypeModel: ObservableObject {
    @Published private(set) var animeTypes: [AnimeSearchQueryType] = [
        AnimeSearchQueryType.tv,
        AnimeSearchQueryType.movie,
        AnimeSearchQueryType.ova,
        AnimeSearchQueryType.special,
        AnimeSearchQueryType.ona,
        AnimeSearchQueryType.music
    ]

}
