//
//  ProfileService.swift
//  InjectedWrapper
//
//  Created by Natalia Andryushina on 2022-01-08.
//

import ServiceLocator

final class ProfileService: IService {

    private (set) var info = ProfileInfo()

    class var service: ProfileService {
        if let service: ProfileService = ServiceLocator.service() {
            return service
        }

        let service = ProfileService()
        return service
    }

    func clear() {
        self.info = ProfileInfo()
    }

    func update(name: String) {
        self.info.name = name
    }
}

struct ProfileInfo {
    var name = ""
}
