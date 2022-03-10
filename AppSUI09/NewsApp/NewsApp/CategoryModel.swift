//
//  CategoryModel.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2021-12-29.
//
import Foundation

final class CategoryModel: ObservableObject {
    @Published private(set) var categories: [CategoryInfo] = [
        CategoryInfo(title: "all"),
        CategoryInfo(title: "national //Indian News only"),
        CategoryInfo(title: "business"),
        CategoryInfo(title: "sports"),
        CategoryInfo(title: "world"),
        CategoryInfo(title: "politics"),
        CategoryInfo(title: "technology"),
        CategoryInfo(title: "startup"),
        CategoryInfo(title: "entertainment"),
        CategoryInfo(title: "miscellaneous"),
        CategoryInfo(title: "hatke"),
        CategoryInfo(title: "science"),
        CategoryInfo(title: "automobile")
    ].sorted {
        $0.title < $1.title
    }

}

struct CategoryInfo: Identifiable {
    let id = UUID()
    var title: String
}
