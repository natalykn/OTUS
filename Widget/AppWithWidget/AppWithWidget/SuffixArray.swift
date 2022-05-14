//
//  SuffixArray.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-03-30.
//

import Foundation

struct SuffixArray: Sequence {
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string)
    }
}

struct SuffixIterator: IteratorProtocol {
    var current: String.SubSequence?
    init(_ string: String) {
        self.current = string.lowercased().suffix(from: string.startIndex)
    }
    
    mutating func next() -> String.SubSequence? {
        guard let thisCurrent = current,
              !thisCurrent.isEmpty else { return nil }
        let index = thisCurrent.index(thisCurrent.startIndex, offsetBy: 1)
        current = thisCurrent.suffix(from: index)
        return thisCurrent
    }
}

extension String {
    func suffixArray() -> [Substring] {
        let separators = CharacterSet.whitespaces.union(.punctuationCharacters)
        let words = components(separatedBy: separators).filter{ !$0.isEmpty }
        let output = words.reduce(into: []) { partialResult, word in
            partialResult += SuffixArray(word)
        }
        
        return output
    }
}

extension Sequence where Element: Hashable {
    var frequency: [Element: Int] { reduce(into: [:]) { $0[$1, default: 0] += 1 } }
}
