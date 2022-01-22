//
//  About.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import CustomTransitions

struct About: View {
    @State private var show = false
    var body: some View {
        return ZStack {
            Button("Open Categories") {
                withAnimation(.easeInOut(duration: 0.8)) {
                    self.show = true
                }
            }
            if show {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray)
                    .overlay(CategoriesScreen(show: $show))
                    .frame(width: 400, height: 500)
                    .transition(.fly)
                    .zIndex(1)
                    
            }
        }
    }
    
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
