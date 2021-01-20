//
//  Like.swift
//  API
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation
import Vapor

struct LikeModel: Content {
    var image: String?
    var user_name: String?
    var post_image: String?
}

extension LikeModel {
    static func getDummyData() -> [LikeModel] {
        var data = [LikeModel]()
        let likeCount = Int.random(in: 1...20)
        for _ in 0...likeCount {
            let profileWidthAndHeight = Int.random(in: 100...300)
            let image = "https://picsum.photos/\(profileWidthAndHeight)/\(profileWidthAndHeight)"
            let tempData = LikeModel(image: image, user_name: randomFakeFirstName(), post_image: image)
            data.append(tempData)
        }
        return data
    }
    static func randomFakeFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan", "cauliflower", "beans", "toystory", "grantorino", "intothewild", "thegodfather"]
        return firstNameList.randomElement()!
    }
}
