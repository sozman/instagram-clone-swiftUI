//
//  NotificationView.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import SwiftUI
import Combine

struct NotificationView: View {
    @ObservedObject var viewModel: NotificationViewModel = NotificationViewModel()
    var body: some View {
        RefreshableScrollView(refreshing: $viewModel.notificationsLoading) {
            VStack {
                if let data: [LikeModel] = viewModel.like {
                    ForEach(data, id: \.self) {
                        NotificationItemView(profileImage: $0.image ?? "", postImage: $0.postImage ?? "", name: $0.userName ?? "")
                    }
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
