//
//  Helpers.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-07.
//

import Foundation
import FirebaseStorage
import UIKit

let storageUrl = "gs://fungi-incognita.appspot.com"

func imageUrlFromFirebase(from cover: String, completionHandler:  @escaping(_ result: URL?, _ error: Error?) -> Void) {
    let storage = Storage.storage()

    let reference: StorageReference = storage.reference(forURL: storageUrl)
    let referenceForUrl: StorageReference = reference.child(cover)
    referenceForUrl.downloadURL { (url, error) in
        if error != nil {
            print((error?.localizedDescription)!)

        }
        completionHandler(url, error)
    }
}

func verifyUrl (url: URL?) -> Bool {
    if let url = url {
        return UIApplication.shared.canOpenURL(url as URL)
    }
    return false
}

func getStrings(data: Data) -> [String] {
    return StorageUserDefaults.loadStringArray(data: data)
}
