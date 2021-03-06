//
//  Playlist.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-03-26.
//

import SwiftUI

struct Playlist: View {
    @EnvironmentObject var model: ServicesModel

    var body: some View {
        VStack {
            Text(model.name()).font(.title)
            List {
                ForEach(model.tracks()) { info in
                    Form {
                        VStack {
                            Text(info.nameTrack).font(.body)
                            Text(info.nameArtist).font(.body)
                            Text(info.nameAlbum).font(.body)
                        }
                    }
                    .frame(height: 100)
                }
            }
        }
        .padding()
    }
}

struct Playlist_Previews: PreviewProvider {
    static var previews: some View {
        Playlist()
    }
}
