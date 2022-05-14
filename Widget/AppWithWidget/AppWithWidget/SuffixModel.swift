//
//  SuffixModel.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-04-17.
//

import Foundation
import SwiftUI
import WidgetKit
import Combine

typealias SuffixInfo = (key: Substring, value: Int)

class SuffixModel: ObservableObject {
    @Published var suffixValues: [Substring: Int] = [:]
    @Published var threeLetterSuffixes: [Substring: Int] = [:]
    @Published var topValues:Array<SuffixInfo> = Array()
    
    @AppStorage("top3", store: UserDefaults(suiteName: "group.com.natalykn.ShareExtension"))
    var top3: Data = Data()

    @AppStorage("history") var history: [String] = []

    init() {
        guard let _ = try? JSONDecoder().decode(Array<String>.self,
                                                from: top3) else {
            var newValue = [SuffixInfo]()
            newValue.append((key:"no data", value:0))
            storeData(with:newValue)
            return
        }
    }
    
    private func storeData(with topValues: Array<SuffixInfo>) {
        var valuesForEncode:Array<String> = Array()
        for item in topValues {
            let newValue = ("\(item.key) - \(item.value)")
            valuesForEncode.append(newValue)
        }
        
        guard let encodedData = try? JSONEncoder().encode(valuesForEncode) else { return }
        top3 = encodedData
        WidgetCenter.shared.reloadTimelines(ofKind: "Suffix")
    }

    func addNewValues (_ newText:String){
        history.append(newText.trim())
        newText.trim().suffixArray().frequency.forEach { (k,v) in
            if let value = self.suffixValues[k] {
                self.suffixValues[k] = value + v
            }
            else{
                self.suffixValues[k] = v
            }
            if k.count >= 3 {
                self.threeLetterSuffixes[k] = self.suffixValues[k]
            }
        }
        checkTopValues()
    }
    
    func checkTopValues(){
        let sorted = self.threeLetterSuffixes.sorted {
            return $0.value > $1.value
        }
        topValues = sorted
        let arrayForStored = Array(topValues.prefix(3))
        storeData(with: arrayForStored)
    }
    
    func sortedArray(selection:Int, isASC:Bool)->Array<Substring>{
        let sorted : Array<Substring>
        switch selection {
        case SegmentIdentifier.allValues.rawValue:
            sorted = isASC == true ? Array(self.suffixValues.keys).sorted() : Array(self.suffixValues.keys).sorted().reversed()
            break
        case SegmentIdentifier.only3.rawValue:
            sorted = isASC == true ? Array(self.threeLetterSuffixes.keys).sorted() : Array(self.threeLetterSuffixes.keys).sorted().reversed()
            break
        case SegmentIdentifier.topValues.rawValue:
            sorted = isASC == true ? Array(self.threeLetterSuffixes.keys).sorted() : Array(self.threeLetterSuffixes.keys).sorted().reversed()
            break
        default:
            sorted = isASC == true ? Array(self.suffixValues.keys).sorted() : Array(self.suffixValues.keys).sorted().reversed()
            break
        }
        return sorted
    }
    
    func topValuesForView(isASC:Bool)->Array<String>{
        var values:Array<String> = Array()
        for item in topValues {
            let newValue = ("\(item.key) - \(item.value)")
            values.append(newValue)
        }
        return isASC ? values : values.reversed()
    }
    
}

