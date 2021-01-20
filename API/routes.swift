//
//  routes.swift
//  API
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import Vapor
import Fluent

func routes(_ app: Application) throws {
    app.get { req in
        return "It works"
    }
}
