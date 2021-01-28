//
//  SearchCategoryModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation

struct SearchCategoryModel: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var logoImage: String?
    var backgroundColor: String?
    var title: String?
    
    init(logoImage: String?, backgroundColor: String?, title: String?) {
        self.logoImage = logoImage
        self.backgroundColor = backgroundColor
        self.title = title
    }
}

extension SearchCategoryModel {
    static func getSearchCategories() -> [SearchCategoryModel] {
        var data = [SearchCategoryModel]()
        let shop = SearchCategoryModel(logoImage: "ic_bag", backgroundColor: "#515BD4", title: "Shop")
        let travel = SearchCategoryModel(logoImage: "ic_plane" , backgroundColor:"#8134AF", title: "Travel")
        let fitness = SearchCategoryModel(logoImage: "ic_fast", backgroundColor: "#DD2A7B", title: "Fitness")
        data.append(shop)
        data.append(travel)
        data.append(fitness)
        return data
    }
}
