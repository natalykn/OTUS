//
//  FungiList.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import Foundation
import SwiftUI

struct FungiList: View {
    var body: some View {
        VStack {
            SearchBlock()
           // FungiShortInfo()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(mainColors2)
        .edgesIgnoringSafeArea(.all)

      /*  VStack {
            TabView {
                ZStack {
                    Rectangle()
                        .fill(mainColors1)
                        .clipped()
                    VStack {
                        SearchBlock()
                        
                        FungiShortInfo()
                    }
                }
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: "house")
                            .imageScale(.large)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .foregroundColor(Color(.systemGray6))
                            .padding(.bottom, 20)
                            .font(.title2)
                    }
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                }
                VStack {
                    SearchBlock()
                    FungiShortInfo()
                }
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: "bookmark")
                            .imageScale(.large)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .padding(.bottom, 20)
                            .foregroundColor(Color.gray)
                            .font(.title2)
                    }
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                }
                VStack {
                    FungiShortInfo()
                }
                .tabItem {
                    VStack {
                        VStack(spacing: 4) {
                            Image("fungi")
                                .fixedSize()
                                .frame(maxHeight: .infinity)
                                .clipped()
                                .padding(.bottom, 20)
                                .foregroundColor(Color.gray)
                                .font(.title2)
                        }
                        .foregroundColor(Color.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .clipped()
                    }
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                }
                VStack {
                    FungiShortInfo()
                }
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 20)
                            .font(.title2)
                    }
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                }
                VStack {
                    FungiShortInfo()
                }
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 20)
                            .font(.title2)
                    }
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                }
                
            }
        }
    }*/
    }

}

struct FungiList_Previews: PreviewProvider {
    static var previews: some View {
        FungiList()
    }
}
