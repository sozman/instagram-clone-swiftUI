//
//  SearchController.swift
//  API
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import Vapor

final class SearchController {
    func getSearch(req: Request) -> [SearchModel] {
        return SearchModel.getDummyData()
    }
}

extension SearchController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("search", use: getSearch)
    }
}
