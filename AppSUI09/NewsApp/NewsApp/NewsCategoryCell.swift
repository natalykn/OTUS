//
//  NewsCategoryCell.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-01-22.
//

import SwiftUI

struct NewsCategoryCell: View {
    var category: CategoryInfo
    var body: some View {
        NavigationLink(destination: NewsList(category: category.title)){
            Text(category.title)
        }
    }
}


struct NewsCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        let category = CategoryInfo(title:"all")

        NewsCategoryCell(category: category)
    }
}
