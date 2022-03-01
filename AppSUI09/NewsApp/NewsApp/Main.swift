//
//  Main.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI
import CustomTransitions

struct Main: View {
    @State private var show = false
    @State private var currentSubviewIndex = 0
    @State private var showingSubview = false
    @State private var title = "Open Categories with custom animation"
    
    var body: some View {
        NavigationView {
            VStack(){
                Button(title) {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        self.show = true
                    }
                }.opacity((self.showingSubview == false).doubleValue)
                RoundedRectangle(cornerRadius: 15)
                    .fill(.clear)
                    .modifier(CustomFrameModifier(active: show))
                    .overlay(CategoriesScreen(show: $show, hideButton: false))
                    .transition(.fly)
                    .zIndex(show.doubleValue)
                    
                StackNavigationView(currentSubviewIndex: self.$currentSubviewIndex, showingSubview: self.$showingSubview, subviewByIndex: {index in self.subView(forIndex: index)}){
                    VStack{
                        Button(action: {
                            self.showSubview(withIndex: 0)
                        }){
                            Text("About")
                        }
                        Button(action: {
                            self.showSubview(withIndex: 1)
                        }){
                            Text("List of categories")
                        }
                    }.opacity((self.show == false).doubleValue)
                }
                Spacer()
            }
        }
    }
    
    private func subView(forIndex index: Int) -> AnyView {
        switch index {
        case 0: return AnyView(About())
        case 1: return AnyView(CategoriesScreen(show: $show, hideButton: true))
        default: return AnyView(Text("Default View").background(Color.blue))
        }
    }
    
    private func showSubview(withIndex index:Int){
        withAnimation(.easeIn(duration: 0.3)){
            currentSubviewIndex = index
            showingSubview = true
        }
    }

}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
