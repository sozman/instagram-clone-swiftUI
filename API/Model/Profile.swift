//
//  Profile.swift
//  API
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import Vapor

struct ProfileModel: Content {
    var image: String?
    var user_name: String?
    var user_description: String?
    var post_count: Int?
    var follow_count: Int?
    var follower_count: Int?
    var posts: [String]?
}

extension ProfileModel {
    static func getDummyData() -> ProfileModel {
        let imageWidth = Int.random(in: 100..<800)
        let imageHeight = Int.random(in: 100..<800)
        let image = "https://picsum.photos/\(imageWidth)/\(imageHeight)"
        let userName = randomFakeFirstName() + " " + randomFakeFirstName()
        let description: String = randomString(minimumLength: 3, maximumLength: 15) + " " + randomString(minimumLength: 3, maximumLength: 10) + " " + randomString(minimumLength: 3, maximumLength: 5)
        let postCount = Int.random(in: 1...30)
        let followCount = Int.random(in: 1...900)
        let followerCount = Int.random(in: 1...900)
        var post = [String]()
        for _ in 0...postCount {
            let postWidth = Int.random(in: 100..<800)
            let postHeight = Int.random(in: 100..<800)
            let postImage = "https://picsum.photos/\(postWidth)/\(postHeight)"
            post.append(postImage)
        }
        let model = ProfileModel(image: image,
                                 user_name: userName,
                                 user_description: description,
                                 post_count: postCount,
                                 follow_count: followCount,
                                 follower_count: followerCount,
                                 posts: post)
        return model
    }
    
    static func randomFakeFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan", "cauliflower", "beans", "toystory", "grantorino", "intothewild", "thegodfather"]
        return firstNameList.randomElement()!
    }
    
    static func randomString(minimumLength min: Int, maximumLength max: Int) -> String {
         return String.random(minimumLength: min, maximumLength: max)
     }
}
