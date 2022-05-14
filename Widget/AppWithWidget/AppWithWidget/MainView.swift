//
//  MainView.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-03-28.
//

import SwiftUI
import UIKit

struct MainView: View {
    @State private var text: String = ""
    @EnvironmentObject var suffixModel: SuffixModel

    var body: some View {
        VStack{
            TextEditor(text: $text)
                .multilineTextAlignment(.center)
                .lineSpacing(10.0)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding()
                .onChange(of: text, perform: { value in
                })
            Button("Create suffix array") {
                self.suffixModel.addNewValues(text)
                print (self.suffixModel.suffixValues.sorted(by: <))
                UIApplication.shared.endEditing()

            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
