//
//  ServicesModel.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-04-03.
//

import SwiftUI

class ServicesModel : ObservableObject {
    @Injected var profile: ProfileService?
    @Injected var playlist: PlaylistService?

    func loginAndLoadPlaylist(login:String) {
        profile?.update(name: login)
        playlist?.load()
    }

    func clear() {
        profile?.clear()
        playlist?.clear()
    }

    func name() -> String {
        profile?.info.name ?? "login failed"
    }

    func tracks() -> [TrackInfo] {
        playlist?.info ?? [TrackInfo()]
    }
}
