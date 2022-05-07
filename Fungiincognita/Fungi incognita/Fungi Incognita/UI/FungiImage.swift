//
//  FungiImage.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-07.
//

import SwiftUI
import SDWebImageSwiftUI

struct FungiImage: View {
    var name: String
    var urlForImage: URL!
    let imageCache: SDImageCache = SDImageCache.shared
    @ViewBuilder
    var body: some View {
        if let cacheImage: UIImage = imageCache.imageFromCache(forKey: name) {
            Image(uiImage: cacheImage)
                .resizable()
                .aspectRatio(contentMode: .fill)

        } else {
            if verifyUrl(url: urlForImage) == false {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                WebImage(url: urlForImage)
                    .onSuccess { image, _, _ in
                        SDImageCache.shared.store(image, forKey: name) {
                            print("url \(String(describing: name))")
                        }
                    }
                    .resizable()
                    .placeholder(Image("profile"))
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}
