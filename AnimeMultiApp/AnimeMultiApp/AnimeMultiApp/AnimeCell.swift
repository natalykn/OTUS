//
//  AnimeCell.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import Networking
import ImageLoader

struct AnimeCell: View {
    @Environment(\.openURL) var openURL
    @State private var show = false
    var anime: Anime
    var body: some View {
        HStack{
#if os(tvOS)
            ImageLoader(url: anime.images?.jpg?.largeImageUrl ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: widthImage)
#else
            ImageLoader(url: anime.images?.jpg?.smallImageUrl ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: widthImage)
            Text(anime.title ?? "")
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        openURL(URL(string: anime.url ?? "")!)
                        
                    }
                }
#endif
        }
    }
    
}
