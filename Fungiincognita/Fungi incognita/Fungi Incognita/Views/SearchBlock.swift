//
//  SearchBlock.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct SearchBlock: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.sRGB, red: 214/255, green: 255/255, blue: 235/255))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .clipped()
                .padding(.top, 70)
                .padding(.horizontal, 26)
                .shadow(color: Color(.sRGB,
                                     red: 0/255,
                                     green: 103/255,
                                     blue: 53/255).opacity(0.5),
                        radius: 40,
                        x: 0,
                        y: 32)
            HStack {
                Text("Mushroom search")
                    .font(.title3)
                    .foregroundColor(Color(.systemGray3))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                    .foregroundColor(Color(.systemGray3))
            }
            .clipped()
            .padding(.bottom, 10)
            .padding(.horizontal, 40)
        }
        .padding(.bottom)

    }
}

struct SearchBlock_Previews: PreviewProvider {
    static var previews: some View {
        SearchBlock()
    }
}
