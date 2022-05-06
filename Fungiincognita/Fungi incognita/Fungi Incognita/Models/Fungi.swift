//
//  Fungi.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-04.
//

import Foundation
import FirebaseFirestoreSwift

struct Fungi: Identifiable, Codable, Hashable {
    @DocumentID var userId: String?
    var id: String
    var name: String
    var description: String
    var link: String?
}
