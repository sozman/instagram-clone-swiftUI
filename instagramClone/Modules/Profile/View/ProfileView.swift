//
//  ProfileView.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import Foundation
import SwiftUI
import WaterfallGrid

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel = ProfileViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ProfileInformationView(image: viewModel.profile?.image ?? "",
                                       name: viewModel.profile?.userName ?? "",
                                       description: viewModel.profile?.userDescription ?? "",
                                       information: ProfileInformationModel(postCount: viewModel.profile?.postCount ?? 0,
                                                                            followCount: viewModel.profile?.followCount ?? 0,
                                                                            followerCount: viewModel.profile?.followerCount ?? 0))
                StoryView(viewModel: HomeViewModel())
                ImageGrid(images: viewModel.images)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
