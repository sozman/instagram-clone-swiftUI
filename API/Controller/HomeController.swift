//
//  HomeController.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor

final class HomeController {
    func getStory(req: Request) -> [Story] {
        return Story.getDummyData()
    }
    
    func getPost(req: Request) -> [Post] {
        return Post.getDummyData()
    }
}

extension HomeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("story", use: getStory)
        routes.get("post", use: getPost)
    }
}
