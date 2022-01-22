//
//  File.swift
//  
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import Foundation
import UIKit

public func verifyUrl (urlString: String?) -> Bool {
    if let urlString = urlString {
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
    }
    return false
}
