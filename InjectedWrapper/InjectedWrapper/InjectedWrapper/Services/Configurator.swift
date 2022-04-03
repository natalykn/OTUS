//
//  Configurator.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-04-03.
//

import SwiftUI
import ServiceLocator

class Configurator {
    static let shared = Configurator()

    func register() {
        ServiceLocator.addService(ProfileService())
        ServiceLocator.addService(PlaylistService())
    }

    func remove() {
        ServiceLocator.removeService(ProfileService())
        ServiceLocator.removeService(PlaylistService())
    }

}
