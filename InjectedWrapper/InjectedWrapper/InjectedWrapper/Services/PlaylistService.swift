//
//  PlaylistService.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-01-08.
//

import Foundation
import ServiceLocator

final class PlaylistService:IService {
    private (set) var info = [TrackInfo()]

    class var service: PlaylistService {
        if let service: PlaylistService = ServiceLocator.service() {
            return service
        }

        let service = PlaylistService()
        ServiceLocator.addService(service)
        return service
    }

    func clear() {
        info.removeAll()
    }

    func remove() {
        ServiceLocator.removeService(self)
    }

    func load() {
        clear()
        let album = "Wicked Gonna Come"
        let artist = "Blues Saraceno, NineOneOne"
        info.append(TrackInfo(nameTrack: "Wicked Gonna Come", nameArtist: artist, nameAlbum: album))
        info.append(TrackInfo(nameTrack: "Evil Got a Hold on Me", nameArtist: artist, nameAlbum: album))
        info.append(TrackInfo(nameTrack: "Good Man Down", nameArtist: artist, nameAlbum: album))
        info.append(TrackInfo(nameTrack: "The Devil Never Sleeps", nameArtist: artist, nameAlbum: album))
    }
}

struct TrackInfo : Identifiable {
    let id = UUID()
    var nameTrack: String = ""
    var nameArtist: String = ""
    var nameAlbum: String = ""
}
