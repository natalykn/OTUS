//
//  CustomModifiers.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-03-01.
//

import SwiftUI

struct CustomFrameModifier: ViewModifier {
    var active: Bool

    @ViewBuilder func body(content: Content) -> some View {
        if active {
            content.frame(width: widthForCategoriesScreen, height: heightForCategoriesScreen)
        } else {
            content.frame(width: 0, height: 0)

        }
    }
}
