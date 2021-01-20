//
//  NotificationViewModel.swift
//  instagramClone
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation
import SwiftUI
import Combine

final class NotificationViewModel: ObservableObject {
    @Published var like: [LikeModel]? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var notificationsLoading: Bool = false {
        didSet {
            if oldValue == false && notificationsLoading == true {
                fetchLike()
            }
        }
    }
    
    init() {
        fetchLike()
    }
    
    public func fetchLike() {
        WebService().getLike { (data) in
            self.like = nil
            self.like = data
            self.notificationsLoading = false
        }
    }
}
