//
//  configure.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    let homeController = HomeController()
    let likeController = LikeController()
    let searchController = SearchController()
    let profileController = ProfileController()
    try app.register(collection: homeController)
    try app.register(collection: likeController)
    try app.register(collection: searchController)
    try app.register(collection: profileController)
    // register routes
    try routes(app)
}
