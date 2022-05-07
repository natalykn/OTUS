//
//  HeaderForProfile.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI

struct HeaderForProfile: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    @AppStorage("profileUrl") var profileUrl = DefaultSettings.profileUrl
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)

            AsyncImage(url: profileUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                @unknown default:
                    EmptyView()
                }
            }
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }
    }
}
