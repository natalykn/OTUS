//
//  PhotoPicker.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import UIKit
import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {

    let configuration: PHPickerConfiguration
    @Binding var isPresenting: Bool
    @Binding var uiImage: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {

        let parent: PhotoPicker

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [self] (object, _) in

                    guard let newImage=object as? UIImage else {
                        return
                    }
                    self.parent.uiImage = newImage.aspectFittedToHeight(imageSize)
                    parent.isPresenting = false
                })
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresenting = false
        }

        init(_ photoPicker: PhotoPicker) {
            self.parent = photoPicker
        }

    }
}
