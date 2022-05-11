//
//  Help.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI

struct Help: View {
    var body: some View {
        List(0..<20) { index in
            ZStack(alignment: .leading) {
                NavigationLink(
                    destination: AnswerCell(idAnswer: index)) {
                        EmptyView()
                    }
                    .opacity(0)
                Text("Question #\(index+1)")
            }
            .navigationTitle("Help")
        }
        .padding(.bottom, 80)
    }
}

struct Help_Previews: PreviewProvider {
    static var previews: some View {
        Help()
    }
}
