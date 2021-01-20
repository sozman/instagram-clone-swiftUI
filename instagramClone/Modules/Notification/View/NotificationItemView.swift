//
//  NotificationItemView.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import SwiftUI

struct NotificationItemView: View {
    @ObservedObject var profileImageLoader: ImageLoader
    @ObservedObject var postImageLoader: ImageLoader
    var name: String = ""
    
    init(profileImage: String, postImage: String, name: String) {
        self.profileImageLoader = ImageLoader(urlString: profileImage)
        self.postImageLoader = ImageLoader(urlString: postImage)
        self.name = name
    }
    
    var body: some View {
        HStack {
            Image(uiImage: profileImageLoader.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
            Text("\(name) following to you")
                .fontWeight(.regular)
                .font(.system(size: 11))
                .padding(.horizontal, 5)
            Spacer()
            Image(uiImage: postImageLoader.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 60, height: 60, alignment: .center)
        }.padding(.horizontal, 10)
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationItemView(profileImage: "", postImage: "", name: "")
    }
}
