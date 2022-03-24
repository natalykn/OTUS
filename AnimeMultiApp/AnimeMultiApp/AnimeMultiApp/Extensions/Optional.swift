//
//  Optional.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-03-14.
//

import Foundation

extension Optional where Wrapped == String {
    var asStringOrEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var asStringOrEmpty: String {
        guard let val = self else { return "" }
        return "\(val)"
    }

    var asIntOrZero: Int {
        guard let val = self else { return 0 }
        return val
    }
}

extension Optional {
    var string: String {
        String(describing: self)
    }

    var isNotNil: Bool {
        self != nil
    }
}
