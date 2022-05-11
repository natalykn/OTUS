//
//  TabBarItem.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct TabBarItem: View {
    var imageName: String
    var tag: TabImems
    @Binding var selectedTabBar: TabImems
    var isSystemImage: Bool
    var isFirst: Bool = false
    @Binding var xOffSet: Double
    var body: some View {
        GeometryReader { reader in
            TabbarButton(image: imageName,
                         tag: tag,
                         selectedTabBar: selectedTabBar,
                         reader: reader,
                         isSystemImage: isSystemImage) {
                withAnimation(Animation.linear(duration: 0.3)) {
                    selectedTabBar = tag
                    xOffSet = reader.frame(in: .global).minX
                }
            }
                         .onAppear(perform: {
                             if isFirst == true {
                                 xOffSet = reader.frame(in: .global).minX
                             }
                         })
        }.frame(width: 30, height: 30)
    }
}
