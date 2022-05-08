//
//  Enums.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

enum TabImems: CaseIterable, Codable {
    case home
    case favList
    case identificationFungi
    case person
    case settings
}

extension TabImems: RawRepresentable {

    typealias RawValue = Int
    init?(rawValue: Int) {
        switch rawValue {
        case 0 : self = .home
        case 1 : self = .favList
        case 2 : self = .identificationFungi
        case 3 : self = .person
        case 4 : self = .settings
        default : return nil
        }
    }

    var rawValue: Int {
        switch self {
        case .home : return 0
        case .favList :  return 1
        case .identificationFungi : return 2
        case .person : return 3
        case .settings : return 4
        }
    }
}
