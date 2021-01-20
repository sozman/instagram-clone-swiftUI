//
//  ProfileInformationView.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import Foundation
import SwiftUI

struct ProfileInformationView: View {
    @ObservedObject var profileImageLoader: ImageLoader
    
    var profileName: String?
    var profileDescription: String?
    var profileInformation: ProfileInformationModel?
    
    init(image: String, name: String, description: String, information: ProfileInformationModel) {
        self.profileImageLoader = ImageLoader(urlString: image)
        self.profileName = name
        self.profileDescription = description
        self.profileInformation = information
    }
    
    var body: some View {
        VStack {
            profilePhotoView()
                .padding(.top, 5)
            userNameView(name: profileName ?? "")
            descriptionView(description: profileDescription ?? "")
            informationsView(information: profileInformation ?? ProfileInformationModel())
                .padding(.bottom, 20)
        }.background(Color.white)
        .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.1),radius: 10, y: 10)
    }
    private func profilePhotoView() -> some View {
        VStack {
            Image(uiImage: profileImageLoader.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(50)
        }
        .frame(width: 110, height: 110, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.init(hex: "#FC0B7B")), Color(UIColor.init(hex: "#7820AD"))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(55)
    }
    
    private func userNameView(name: String) -> some View {
        Text(name)
            .fontWeight(.bold)
            .font(.system(size: 25))
            .foregroundColor(Color(UIColor.init(hex: "#181818")))
            .padding(.horizontal, 25)
    }
    
    private func descriptionView(description: String) -> some View {
        Text(description)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .font(.system(size: 10))
            .foregroundColor(Color(UIColor.init(hex: "#31323B")))
            .padding(.horizontal, 45)
            .padding(.top, 1)
    }
    
    private func informationsView(information: ProfileInformationModel) -> some View {
        HStack {
            postView(post: information.postCount ?? 0)
            Spacer()
            followsView(follow: information.followCount ?? 0)
            Spacer()
            followerView(follower: information.followerCount ?? 0)
        }
        .padding(.horizontal, 60)
        .padding(.top, 10)
    }
    
    private func postView(post: Int) -> some View {
        VStack {
            Text("\(post)")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.init(hex: "#31323B")))
            Text("Post")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.init(hex: "#A3A3A3")))
        }
    }
    
    private func followsView(follow: Int) -> some View {
        VStack {
            Text("\(follow)")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.init(hex: "#31323B")))
            Text("Follow")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.init(hex: "#A3A3A3")))
        }
    }
    
    private func followerView(follower: Int) -> some View {
        VStack {
            Text("\(follower)")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(Color(UIColor.init(hex: "#31323B")))
            Text("Follower")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.init(hex: "#A3A3A3")))
        }
    }
}

struct ProfileInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInformationView(image: "", name: "", description: "", information: ProfileInformationModel())
    }
}
