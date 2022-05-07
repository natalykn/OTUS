//
//  FungiRepository.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-04.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class FungiRepository: ObservableObject {
    private let path: String = "fungies"
    private let store = Firestore.firestore()

    @Published var fungies: [Fungi] = []

    var userId = ""
    private let authenticationService = AuthenticationService()
    private var cancellables: Set<AnyCancellable> = []

    init() {
        authenticationService.$user
            .compactMap { user in
                user?.uid
            }
            .assign(to: \.userId, on: self)
            .store(in: &cancellables)

        authenticationService.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.get()
            }
            .store(in: &cancellables)
    }

    func get() {
        store
            .collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting fungies: \(error.localizedDescription)")
                    return
                }
                self.fungies = querySnapshot?.documents.compactMap { document in
                    return try? document.data(as: Fungi.self)
                } ?? []
                self.fungies.sort {
                    $0.name < $1.name
                }
            }
    }
}
