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
    case resultView
    case history
}

enum SegmentIdentifier: Int, Hashable {
    case allValues = 0
    case only3
    case topValues
}
