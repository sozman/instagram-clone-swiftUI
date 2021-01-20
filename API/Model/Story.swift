//
//  Story.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor

struct Story: Content {
    var image: String?
    var user_name: String?
}

extension Story {
    static func getDummyData() -> [Story] {
        var data = [Story]()
        for _ in 0..<25 {
            let first = Int.random(in: 100..<800)
            let second = Int.random(in: 100..<800)
            let tempData = Story(image: "https://picsum.photos/\(first)/\(second)",
                user_name: randomFakeFirstName())
            data.append(tempData)
        }
        return data
    }
    static func randomFakeFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan", "cauliflower", "beans", "toystory", "grantorino", "intothewild", "thegodfather"]
        return firstNameList.randomElement()!
    }
}
