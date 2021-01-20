//
//  Post.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor

struct Post: Content {
    var image: String?
    var user_name: String?
    var post: String?
    var like: [Like]?
    var comment: [Comment]?
    var time: Int?
}

struct Like: Content {
    var image: String?
    var user_name: String?
}


struct Comment: Content {
    var user_name: String?
    var comment: String?
}


extension Post {
    static func getDummyData() -> [Post] {
        let postCount = Int.random(in: 1...20)
        var data = [Post]()
        for _ in 0...postCount {
            let first = Int.random(in: 100..<200)
            let second = Int.random(in: 300..<800)
            let third = Int.random(in: 300..<800)
            let time = Int.random(in: 1..<60)
            let image = "https://picsum.photos/\(first)/\(first)"
            let name = randomFakeFirstName()
            let post = "https://picsum.photos/\(second)/\(third)"
            let like = getDummyLike()
            let comment = getDummyComment()
            let tempData = Post(image: image, user_name: name, post: post, like: like, comment: comment, time: time)
            data.append(tempData)
        }
        return data
    }
    
    static func randomFakeFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan", "cauliflower", "beans", "toystory", "grantorino", "intothewild", "thegodfather"]
        return firstNameList.randomElement()!
    }
    
    static func getDummyLike() -> [Like] {
        var data = [Like]()
        for _ in 0...100 {
            let first = Int.random(in: 100..<200)
            let image = "https://picsum.photos/seed/picsum/\(first)/\(first)"
            let name = randomFakeFirstName()
            let dummyData = Like(image: image, user_name: name)
            data.append(dummyData)
        }
        return data
    }
    
    static func getDummyComment() -> [Comment] {
        var data = [Comment]()
        for _ in 0...400 {
            let name = randomFakeFirstName()
            let first = randomString(minimumLength: 3, maximumLength: 10)
            let second = randomString(minimumLength: 3, maximumLength: 10)
            let third = randomString(minimumLength: 3, maximumLength: 10)
            let sentence = first + " " + second + " " + third
            let tempData = Comment(user_name: name, comment: sentence)
            data.append(tempData)
        }
        return data
    }
    
    static func randomString(minimumLength min: Int, maximumLength max: Int) -> String {
         return String.random(minimumLength: min, maximumLength: max)
     }
}


public extension String {
    /// SwiftRandom extension
    static func random(ofLength length: Int) -> String {
        return random(minimumLength: length, maximumLength: length)
    }
    
    /// SwiftRandom extension
    static func random(minimumLength min: Int, maximumLength max: Int) -> String {
        return random(
            withCharactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
            minimumLength: min,
            maximumLength: max
        )
    }
    
    /// SwiftRandom extension
    static func random(withCharactersInString string: String, ofLength length: Int) -> String {
        return random(
            withCharactersInString: string,
            minimumLength: length,
            maximumLength: length
        )
    }
    
    /// SwiftRandom extension
    static func random(withCharactersInString string: String, minimumLength min: Int, maximumLength max: Int) -> String {
        guard min > 0 && max >= min else {
            return ""
        }
        
        let length: Int = (min < max) ? .random(in: min...max) : max
        var randomString = ""
        
        (1...length).forEach { _ in
            let randomIndex: Int = .random(in: 0..<string.count)
            let c = string.index(string.startIndex, offsetBy: randomIndex)
            randomString += String(string[c])
        }
        
        return randomString
    }
}
