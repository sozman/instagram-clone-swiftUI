//
//  ProfileModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation


struct ProfileModel: Codable {
    var image: String?
    var userName: String?
    var userDescription: String?
    var postCount: Int?
    var followCount: Int?
    var followerCount: Int?
    var posts: [String]?
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case userName = "user_name"
        case userDescription = "user_description"
        case postCount = "post_count"
        case followCount = "follow_count"
        case followerCount = "follower_count"
        case posts = "posts"
    }
}

struct ProfileInformationModel {
    var postCount: Int?
    var followCount: Int?
    var followerCount: Int?
}
