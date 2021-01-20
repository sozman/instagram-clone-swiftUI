//
//  TabbarRouter.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import Foundation
import SwiftUI

class TabbarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case liked
    case records
    case user
}
