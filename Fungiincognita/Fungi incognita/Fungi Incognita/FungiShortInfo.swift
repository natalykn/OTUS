//
//  FungiShortInfo.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI
import FirebaseStorage

struct FungiShortInfo: View {
    var fungi: Fungi
    @State private var imageURL = URL(string: "")

    @State private var showSafari: Bool = false
    @State private var isFav: Bool = false
    @EnvironmentObject var fungiRepository: FungiRepository

    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 112)
                    .clipped()
                    .padding(.horizontal, 26)
                    .padding(.vertical)
                    .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 10)
                    .onAppear {
                        loadImageFromFirebase()
                        isFav = fungiRepository.isFavoritesFungi(idFungi: fungi.id)
                    }
                HStack(alignment: .top) {
                    FungiImage(name: fungi.name, urlForImage: imageURL)
                        .frame(width: 92, height: 92)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(Color.clear)
                    VStack(alignment: .leading) {
                        Text(fungi.name)
                            .font(.title2)
                            .foregroundColor(Color.gray)
                        Text(fungi.description)
                            .font(.body)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 92)
                .clipped()
                .padding(.horizontal, 36)
                Image(systemName: "bookmark.fill")
                    .imageScale(.large)
                    .foregroundColor(isFav ? .pink : .gray.opacity(0.1))
                    .font(.title2)
                    .offset(x: -30, y: -46)
                    .onTapGesture {
                        isFav.toggle()
                        if isFav == true {
                            fungiRepository.addFungiToFavorites(idFungi: fungi.id)
                        } else {
                            fungiRepository.removeFungiToFavorites(idFungi: fungi.id)
                        }
                    }
            }
        }
        .frame(minWidth: 0, minHeight: 132)
        .clipped()
        .padding(.top, 0)
        .onTapGesture {
            showSafari.toggle()
        }
        .fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper(url: URL(string: fungi.link ?? "https://www.wikipedia.org")!)
        })

    }

    func loadImageFromFirebase() {
        let path = "/images/" + fungi.name + ".jpg"
        imageUrlFromFirebase(from: path) { url, error in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            self.imageURL = url!
        }
    }
}
