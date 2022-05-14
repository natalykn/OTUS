//
//  CommonValues.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-04-18.
//

import Foundation

enum JobQueueError: Error {
    case badTimeStart
    case unknownError
}

enum TabIdentifier: Hashable {
    case newText
    case history
}

enum SegmentIdentifier: Int, Hashable {
    case allValues = 0
    case only3
    case topValues
}

/*extension SegmentIdentifier {
    var intValue: Int {
        get {
            switch self {
            case let .allValues(int): return int
            case let .only3(int): return int
            case let .topValues(int): return int
            }
        }
        set {
            switch self {
            case .allValues: self = .allValues(newValue)
            case .only3: self = .only3(newValue)
            case .topValues: self = .topValues(newValue)
            }
        }
    }
}*/
