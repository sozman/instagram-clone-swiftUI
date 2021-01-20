//
//  LikeController.swift
//  API
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation
import Vapor

final class LikeController {
    func getLike(req: Request) -> [LikeModel] {
        return LikeModel.getDummyData()
    }
}

extension LikeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("like", use: getLike)
    }
}
