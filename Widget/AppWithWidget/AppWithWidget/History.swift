//
//  History.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-03-28.
//

import SwiftUI

let topCountValue = 10

struct History: View {
    @EnvironmentObject var suffixModel: SuffixModel
    @State private var selection:Int = SegmentIdentifier.allValues.rawValue
    @State private var sortByASC = true
    
    var body: some View {
        VStack{
            Toggle("ASC", isOn: $sortByASC)
                .toggleStyle(SwitchToggleStyle(tint: .mint))
            Spacer()
            Picker("", selection: $selection) {
                Text("All").tag(SegmentIdentifier.allValues.rawValue)
                Text("Only >=3").tag(SegmentIdentifier.only3.rawValue)
                Text("Top").tag(SegmentIdentifier.topValues.rawValue)
            }
            .pickerStyle(.segmented)
            ListValues(selection: $selection, sortByASC: $sortByASC).environmentObject(self.suffixModel)
            Spacer()
        }
        .padding()
    }
}


struct ListValues: View {
    @EnvironmentObject var suffixModel: SuffixModel
    @Binding var selection: Int
    @Binding var sortByASC: Bool
    var body: some View {
        let sorted = self.suffixModel.sortedArray(selection: selection, isASC: sortByASC)
        if selection == SegmentIdentifier.allValues.rawValue{
            List {
                ForEach(sorted, id: \.self) { (key) in
                    CellRes(firstValue: key, secondValue: (self.suffixModel.suffixValues[key] ?? 0))
                }
            }.opacity(sorted.isEmpty ? 0:1)
        }
        else if selection == SegmentIdentifier.only3.rawValue{
            List {
                ForEach(sorted, id: \.self) { (key) in
                    CellRes(firstValue: key, secondValue: (self.suffixModel.threeLetterSuffixes[key] ?? 0))
                }
            }.opacity(sorted.isEmpty ? 0:1)
        }
        else {
            List{
                ForEach(self.suffixModel.topValuesForView(isASC: sortByASC), id: \.self){value in
                    Text(value)
                }
            }.opacity(sorted.isEmpty ? 0:1)
        }
    }
}


struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
