//
//  RoundedButton.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-08.
//

import SwiftUI

struct RoundedButton: View {
    let text: String
    let color: Color = Color.white
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            Text(text)
                .foregroundColor(color)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color, lineWidth: 2)
                )
        }).buttonStyle(.plain)
    }
}
