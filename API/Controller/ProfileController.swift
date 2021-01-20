//
//  ProfileController.swift
//  API
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import Vapor

final class ProfileController {
    func getProfile(req: Request) -> ProfileModel {
        return ProfileModel.getDummyData()
    }
}

extension ProfileController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("profile", use: getProfile)
    }
}
