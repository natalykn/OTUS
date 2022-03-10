//
//  About.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-03-01.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack {
            Text(aboutText)
                .font(.callout)
                .frame( maxHeight: .infinity)
        }
        .padding()
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
