//
//  TabBarButton.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct TabbarButton: View {
    public var image: String
    public var tag: TabImems

    public var selectedTabBar: TabImems

    public var reader: GeometryProxy
    public var xOffSet: CGFloat = 0
    public var imageSize: CGFloat = 25
    public var isSystemImage: Bool = false
    public var backgroundColor: Color = mainColors
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            imageForButton()
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
                .foregroundColor(selectedTabBar == tag ? colorForSelected : colorForSelected.opacity(0.6))
                .padding(selectedTabBar == tag ? 15 : 0)
                .background(backgroundColor.opacity(selectedTabBar == tag ? 1 : 0)
                    .clipShape(Circle()))
                .offset(x: selectedTabBar == tag ? (reader.frame(in: .global).minX-reader.frame(in: .global).midX) : 0,
                        y: selectedTabBar == tag ? -2*imageSize : 0)
        }
    }

    func imageForButton() -> Image {
        isSystemImage ? Image(systemName: image) : Image(image)

    }
}
