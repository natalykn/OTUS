//
//  CellRes.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-05-14.
//

import SwiftUI

struct CellRes: View {
    var firstValue: Substring
    var secondValue: Int
    var body: some View {
        HStack {
            Text(firstValue)
            Spacer()
            Text("\(secondValue)")
        }
    }
}

struct CellRes_Previews: PreviewProvider {
    static var previews: some View {
        CellRes(firstValue: "text", secondValue: 1)
    }
}
