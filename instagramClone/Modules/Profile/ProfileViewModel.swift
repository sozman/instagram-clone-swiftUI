//
//  ProfileViewModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 20.01.2021.
//

import Foundation
import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var profile: ProfileModel? {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var images: [String] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        fetchProfile()
    }
    
    public func fetchProfile() {
        WebService().getProfile { (response) in
            self.profile = response
            response.posts?.forEach({ (data) in
                self.images.append(data)
            })
        }
    }
}
