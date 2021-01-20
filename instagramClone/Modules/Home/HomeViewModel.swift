//
//  HomeViewModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import Foundation
import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var story: [Story]? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var post: [Post]? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var storyLoading: Bool = false {
        didSet {
            if oldValue == false && storyLoading == true {
                fetchStory()
                fetchPost()
            }
        }
    }
    
    init() {
        fetchStory()
        fetchPost()
    }
        
    public func fetchStory() {
        WebService().getStory { (data) in
            self.story = nil
            self.story = data
        }
    }
    
    public func fetchPost() {
        WebService().getPost { (data) in
            self.post = nil
            self.post = data
            self.storyLoading = false
        }
    }
}

