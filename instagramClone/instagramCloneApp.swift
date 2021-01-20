//
//  instagramCloneApp.swift
//  instagramClone
//
//  Created by Sinan Özman on 12.01.2021.
//

import SwiftUI

@main
struct instagramCloneApp: App {
    var body: some Scene {
        WindowGroup {
            Tabbar(tabbarRouter: TabbarRouter())
        }
    }
}
