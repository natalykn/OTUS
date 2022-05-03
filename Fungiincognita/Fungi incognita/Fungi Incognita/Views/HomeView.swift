//
//  HomeView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      /*  Button(
            action: {
                let numbers = [0]
                _ = numbers[1]

            },
            label: {
                Text("Done")
            }
        )*/
        VStack {}
            .frame(height: 80)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(mainColors1)
        .edgesIgnoringSafeArea(.all)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
