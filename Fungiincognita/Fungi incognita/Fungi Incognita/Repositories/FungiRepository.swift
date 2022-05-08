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
import SwiftUI

class FungiRepository: ObservableObject {
    private let path: String = "fungies"
    private let store = Firestore.firestore()

    @Published var fungies: [Fungi] = []
    @AppStorage("favorites") var favoritesData: Data = Data()
    @Published var favorites: [String] = []

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
        favorites = getStrings(data: favoritesData)
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

    func updateFavorites(_ newValue: [String]) {
        favoritesData = StorageUserDefaults.archiveStringArray(object: newValue)
        favorites = getStrings(data: favoritesData)
    }

    func isFavoritesFungi(idFungi: String) -> Bool {
        return favorites.contains(idFungi)
    }

    func addFungiToFavorites(idFungi: String) {
        favorites.append(idFungi)
        updateFavorites(favorites)
    }

    func removeFungiToFavorites(idFungi: String) {
        if let index = favorites.firstIndex(of: idFungi) {
            favorites.remove(at: index)
        }
        updateFavorites(favorites)
    }

    func searchResults(searchText: String, onlyFavorites: Bool) -> [Fungi] {
        let valueForList: [Fungi] = (onlyFavorites == true ? onlyFavoritesFungies() : fungies)
        if searchText.isEmpty {
            return valueForList
        } else {
            return valueForList.filter { $0.name.contains(searchText) }
        }
    }

    func onlyFavoritesFungies() -> [Fungi] {
        fungies.filter { favorites.contains($0.id) }
    }

}
