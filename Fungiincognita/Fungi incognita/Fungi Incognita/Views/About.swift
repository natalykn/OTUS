//
//  About.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-08.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack(spacing: 10) {
            AppIcon()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(Color.clear)
            Text("\(Bundle.main.appName)")
                .font(.title)

            Text("Ver:\(Bundle.main.releaseVersionNumberPretty)")
                .font(.title)

            Text(Bundle.main.copyright)
                .multilineTextAlignment(.center)
                .font(.caption)
            VStack {}
                .frame(height: 80)
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
