//
//  ContentView.swift
//  Fungi incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabBar = TabImems.home
    @State public var xOffSet: Double = 0
    @EnvironmentObject var fungiRepository: FungiRepository

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {

        ZStack(alignment: Alignment(horizontal: .center,
                                    vertical: .bottom)) {

            TabView(selection: $selectedTabBar) {
                switch selectedTabBar {
                case .home:
                    FungiesList(onlyFavorities: false).environmentObject(fungiRepository)
                case .favList:
                    FungiesList(onlyFavorities: true).environmentObject(fungiRepository)
                case .identificationFungi:
                    IdentificationView(classifier: ImageClassifier())
                case .person:
                    ProfileView()
                case .settings:
                    InfoView()
                }
            }

            HStack {
                TabBarItem(imageName: "house",
                           tag: .home,
                           selectedTabBar: $selectedTabBar,
                           isSystemImage: true,
                           isFirst: true,
                           xOffSet: $xOffSet)
                Spacer(minLength: 0)
                TabBarItem(imageName: "bookmark",
                           tag: .favList,
                           selectedTabBar: $selectedTabBar,
                           isSystemImage: true,
                           isFirst: false,
                           xOffSet: $xOffSet)

                Spacer(minLength: 0)
                TabBarItem(imageName: "fungi",
                           tag: .identificationFungi,
                           selectedTabBar: $selectedTabBar,
                           isSystemImage: false,
                           isFirst: false,
                           xOffSet: $xOffSet)
                Spacer(minLength: 0)
                TabBarItem(imageName: "person",
                           tag: .person,
                           selectedTabBar: $selectedTabBar,
                           isSystemImage: true,
                           isFirst: false,
                           xOffSet: $xOffSet)
                Spacer(minLength: 0)
                TabBarItem(imageName: "info.circle",
                           tag: .settings,
                           selectedTabBar: $selectedTabBar,
                           isSystemImage: true,
                           isFirst: false,
                           xOffSet: $xOffSet)
            }
            .padding(.horizontal, 25).padding(.vertical)
            .background(mainColors.clipShape(CustomShape(xOffSet: xOffSet)).cornerRadius(10))
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
