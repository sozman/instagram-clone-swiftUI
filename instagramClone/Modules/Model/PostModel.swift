//
//  PostModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var image: String?
    var userName: String?
    var post: String?
    var like: [Like]?
    var comment: [Comment]?
    var time: Int?
    
    init(image: String?, userName: String?, post: String?, like: [Like]?, comment: [Comment]?, time: Int?) {
        self.image = image
        self.userName = userName
        self.post = post
        self.like = like
        self.comment = comment
        self.time = time
    }
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case userName = "user_name"
        case post = "post"
        case like = "like"
        case comment = "comment"
        case time = "time"
    }
}

struct Like: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var image: String?
    var userName: String?
    
    init(image: String?, userName: String?) {
        self.image = image
        self.userName = userName
    }
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case userName = "user_name"
    }
}


struct Comment: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var userName: String?
    var comment: String?
    
    init(userName: String?, comment: String?) {
        self.userName = userName
        self.comment = comment
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case comment = "comment"
    }
}
