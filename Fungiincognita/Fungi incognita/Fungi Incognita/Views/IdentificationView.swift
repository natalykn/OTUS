//
//  IdentificationView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI
import CoreML
import Photos
import PhotosUI

struct IdentificationView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo")
                    .onTapGesture {
                        uiImage = nil
                        classifier.clear()
                        isPresenting = true
                        sourceType = .photoLibrary
                    }
            }
            .font(.title)
            .foregroundColor(mainColors)
            Rectangle()
                .strokeBorder()
                .foregroundColor(mainColors)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                )

            VStack {
                Group {
                    if let imageClass = classifier.imageClass {
                        HStack {
                            Text("Image categories:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                    } else {
                        HStack {
                            Text("Image categories: N/A")
                                .font(.caption)
                        }
                    }
                }
                .font(.subheadline)
                .padding()
            }
            VStack {}
                .frame(height: 80)
        }

        .sheet(isPresented: $isPresenting) {
            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            PhotoPicker(configuration: configuration, isPresenting: $isPresenting, uiImage: $uiImage)
                .onDisappear {
                    guard let tempImage = uiImage else {
                        return
                    }
                    classifier.detect(cvPixelBuffer: (tempImage.pixelBuffer(width: Int(imageSize),
                                                                            height: Int(imageSize))))
                }
        }
        .padding()
    }
}

struct IdentificationView_Previews: PreviewProvider {
    static var previews: some View {
        IdentificationView(classifier: ImageClassifier())
    }
}
