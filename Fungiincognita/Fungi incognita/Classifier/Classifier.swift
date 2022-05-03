//
//  Classifier.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import CoreML
import Vision
import UIKit

struct Classifier {

    private(set) var results: String?

    mutating func detect(ciImage: CIImage) {

        guard let model = try? VNCoreMLModel(for: FungiClassifierWithAugms(configuration: MLModelConfiguration()).model)
        else {
            return
        }

        let request = VNCoreMLRequest(model: model)
        request.imageCropAndScaleOption = .centerCrop

        let handler = VNImageRequestHandler(ciImage: ciImage)

        try? handler.perform([request])

        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }

        parserValue(results: results)

    }

    mutating func detect(cgImage: CGImage) {

        guard let model = try? VNCoreMLModel(for: FungiClassifierWithAugms(configuration: MLModelConfiguration()).model)
        else {
            return
        }

        let request = VNCoreMLRequest(model: model)
        request.imageCropAndScaleOption = .centerCrop

        let handler = VNImageRequestHandler(cgImage: cgImage)

        try? handler.perform([request])

        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }

        parserValue(results: results)

    }

    mutating func detect(cvPixelBuffer: CVPixelBuffer) {

        guard let model = try? FungiClassifierWithAugms(configuration: MLModelConfiguration())
        else {
            return
        }

        if let prediction = try? model.prediction(image: cvPixelBuffer) {
            for classLabel in prediction.classLabelProbs {
                print(classLabel)
            }
        }

        guard let modelCoreML = try? VNCoreMLModel(for: model.model)
        else {
            return
        }

        let request = VNCoreMLRequest(model: modelCoreML)
        request.imageCropAndScaleOption = .centerCrop

        let handler = VNImageRequestHandler(cvPixelBuffer: cvPixelBuffer)

        try? handler.perform([request])

        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        parserValue(results: results)
    }

    mutating func parserValue (results: [VNClassificationObservation]) {
        if let firstResult = results.first {
            let formatted = String(format: "%.2f", firstResult.confidence * 100)
            self.results = "\(firstResult.identifier) \(formatted)%"
        }
    }

    mutating func clear() {
        self.results = "N/A"
    }

}
