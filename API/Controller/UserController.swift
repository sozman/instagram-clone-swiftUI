//
//  UserController.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor
import Fluent

final class UserController {
    func getUser(req: Request) -> String {
        return "UserModel.query(on: req.db).all()"
    }
    
    func test(req: Request) -> String {
        return "merhaba"
    }
}

extension UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("merhaba", use: test)
        routes.get("test", use: getUser)
    }
}
