//
//  AnimeCell.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import Networking

struct AnimeCell: View {
    @Environment(\.openURL) var openURL
    @State private var show = false

    var anime: Anime
    var body: some View {
        Text(anime.title ?? "")
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.8)) {
                    openURL(URL(string: anime.url ?? "")!)

                }
            }
            .padding()
    }

}

/*struct RecordingCell_Previews: PreviewProvider {
    static var previews: some View {
        let recording = Recording(gen: "Title", url: "https://www.google.com/")
        RecordingCell(recording: recording)
    }
}*/
