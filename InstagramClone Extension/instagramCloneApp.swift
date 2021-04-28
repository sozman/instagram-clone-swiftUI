//
//  instagramCloneApp.swift
//  InstagramClone Extension
//
//  Created by Sinan Özman on 29.04.2021.
//

import SwiftUI

@main
struct instagramCloneApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
