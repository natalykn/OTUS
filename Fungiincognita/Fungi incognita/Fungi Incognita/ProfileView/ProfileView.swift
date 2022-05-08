//
//  ProfileView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            VStack {
                HeaderForProfile()
                ProfileText()
            }
            Spacer()

            RoundedRectangle(cornerRadius: 11, style: .continuous)
                .frame(height: 46)
                .clipped()
                .foregroundColor(Color(.secondarySystemFill).opacity(0.5))
                .overlay(HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                        .font(.title2)
                }
                    .foregroundColor(mainColors), alignment: .center)
                .padding()
                .onTapGesture {
                    self.isPresented = true                    }
                .sheet(isPresented: $isPresented, content: {
                    SettingsViewForProfile()
                })
            VStack {}
                .frame(height: 80)

        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(mainColors3)
    }
}

struct ProfileText: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("description") var description = DefaultSettings.description

    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                    .foregroundColor(mainColors)
            }.padding()
            ScrollView {
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(mainColors)
                    .padding()
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
