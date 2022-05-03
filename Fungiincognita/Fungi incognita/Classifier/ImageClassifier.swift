//
//  ImageClassifier.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

class ImageClassifier: ObservableObject {

    @Published private var classifier = Classifier()

    var imageClass: String? {
        classifier.results
    }

    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }

    func detect(cgImage: CGImage) {
        classifier.detect(cgImage: cgImage)
    }

    func detect(cvPixelBuffer: CVPixelBuffer?) {
        if cvPixelBuffer != nil {
            classifier.detect(cvPixelBuffer: cvPixelBuffer!)
        }
    }
    func clear() {
        classifier.clear()
    }
}
