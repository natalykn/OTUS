//
//  WidgetView.swift
//  SuffixExtension
//
//  Created by Natalia Andryushina on 2022-05-14.
//

import WidgetKit
import SwiftUI
import Intents

struct MainWidgetView: View {
    var top3: Array<String>
    @Environment(\.widgetFamily) var family
    @ViewBuilder
    var body: some View {
        ZStack {
            Color(UIColor.systemCyan)
            VStack{
                Spacer()
                Link(destination: URL(string: Links.newTextPath)!, label: {
                    Text("Add word")
                        .foregroundColor(Color.blue)
                        .font(.title)

                })
                if (family != .systemSmall){
                    Spacer()
                    Link(destination: URL(string: Links.historyPath)!, label: {
                        Text("History")
                            .foregroundColor(Color.blue)
                            .font(.title)
                    })
                }
                Spacer()
                ForEach(top3, id: \.self) { string in
                    Text(string)
                }
                Spacer()
            }
        }
    }
}
