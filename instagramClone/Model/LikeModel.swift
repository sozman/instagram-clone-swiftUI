//
//  LikeModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation

struct LikeModel: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var image: String?
    var userName: String?
    var postImage: String?
    
    init(image: String?, userName: String?, postImage: String?) {
        self.image = image
        self.userName = userName
        self.postImage = postImage
    }
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
        case userName = "user_name"
        case postImage = "post_image"
    }
}
