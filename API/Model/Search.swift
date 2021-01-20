//
//  Search.swift
//  API
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import Vapor

struct SearchModel: Content {
    var image: String?
}

extension SearchModel {
    static func getDummyData() -> [SearchModel] {
        var data = [SearchModel]()
        let searchCount = Int.random(in: 1...30)
        for _ in 0...searchCount {
            let profileWidthAndHeight = Int.random(in: 100...300)
            let image = "https://picsum.photos/\(profileWidthAndHeight)/\(profileWidthAndHeight)"
            let tempData = SearchModel(image: image)
            data.append(tempData)
        }
        return data
    }
}
