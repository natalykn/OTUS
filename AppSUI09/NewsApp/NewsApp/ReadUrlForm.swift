//
//  ReadUrlForm.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import Networking

struct ReadUrlForm: View {
    @Binding var show: Bool
    @Environment(\.openURL) var openURL

    var readUrl:String
    var body: some View {

        VStack {
            Form{
                if verifyUrl(urlString: readUrl) {
                    Button(action: {
                        openURL(URL(string: readUrl)!)
                    }) {
                        HStack { Spacer(); Text("Read more..."); Spacer() }
                    }
                }
                else{
                    Text("No detailed information")
                        .font(.body)
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.show = false
                    }
                }) {
                    HStack { Spacer(); Text("Close"); Spacer() }
                }
            }
            .background(.white)
        }.padding(20)
    }
}
