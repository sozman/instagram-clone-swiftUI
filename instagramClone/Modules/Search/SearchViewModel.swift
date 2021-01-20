//
//  SearchViewModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchCategories: [SearchCategoryModel]? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var search: [String] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        fetchCategories()
        fetchSearch()
    }
    
    public func fetchCategories() {
        searchCategories = SearchCategoryModel.getSearchCategories()
    }
    
    public func fetchSearch() {
        search.removeAll()
        WebService().getSearch { (response) in
            response.forEach { (data) in
                self.search.append(data.image ?? "")
            }
        }
    }
}
