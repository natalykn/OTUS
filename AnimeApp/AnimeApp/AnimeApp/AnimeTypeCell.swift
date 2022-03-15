//
//  AnimeTypeCell.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import Networking

struct AnimeTypeCell: View {
    var animeType: AnimeSearchQueryType
    var body: some View {
        NavigationLink(destination: AnimeList(category: animeType)) {
            Text(animeType.rawValue)
        }
        .padding()
    }
}

struct AnimeTypeCell_Previews: PreviewProvider {
    static var previews: some View {
        let category = AnimeSearchQueryType.tv

        AnimeTypeCell(animeType: category)
    }
}
