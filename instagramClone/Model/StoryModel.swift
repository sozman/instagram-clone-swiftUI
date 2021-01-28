//
//  StoryModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation

struct Story: Codable, Hashable, Identifiable {
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
