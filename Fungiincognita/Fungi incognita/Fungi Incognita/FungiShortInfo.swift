//
//  FungiShortInfo.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct FungiShortInfo: View {
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 112)
                    .clipped()
                    .padding(.horizontal, 26)
                    .padding(.vertical)
                    .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 10)
                HStack(alignment: .top) {
                    Image("myImage")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 92)
                        .clipped()
                        .padding(.trailing, 10)
                    VStack(alignment: .leading) {
                        Text("Mushroom name")
                            .font(.title2)
                            .foregroundColor(Color(.systemGray5))
                        Text("Mushroom short description")
                            .font(.body)
                            .foregroundColor(Color(.systemGray5))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 92)
                .clipped()
                .padding(.horizontal, 36)
                Image(systemName: "bookmark.fill")
                    .imageScale(.large)
                    .foregroundColor(Color.pink)
                    .font(.title2)
                    .offset(x: -30, y: -46)
            }
        }
        .frame(minWidth: 0, minHeight: 172)
        .clipped()
        .padding(.top, 0)
    }
}
