//
//  AnswerCell.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-11.
//

import SwiftUI

struct AnswerCell: View {
    var idAnswer: Int
    var body: some View {
        Text("Answer #\(idAnswer+1)")
        Spacer()
    }
}

struct AnswerCell_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCell(idAnswer: 1)
    }
}
