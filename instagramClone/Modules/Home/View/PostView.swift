//
//  PostView.swift
//  instagramClone
//
//  Created by Sinan Özman on 15.01.2021.
//

import Foundation
import SwiftUI

struct PostView: View {
    @State var post: Post?
    var body: some View {
        VStack {
            TopOfPost(imageURL: post?.image ?? "", userName: post?.userName ?? "", time: post?.time ?? 0)
                .padding(.top, 15)
            MainPost(postImageURL: post?.post ?? "", likeCount: post?.like)
                .padding(.top, 10)
            BottomOfPost(firstOwnerNameOfLike: post?.like?.first?.userName ?? "",
                         totalLikeCount: post?.like?.count ?? 0,
                         ownerNameValue: post?.comment?.first?.userName ?? "",
                         ownerCommentValue: post?.comment?.first?.comment ?? "",
                         totalCommentCount: post?.comment?.count ?? 0,
                         lastNameValue: post?.comment?.last?.userName ?? "",
                         lastCommentValue: post?.comment?.last?.comment ?? "")
                .padding(.bottom, 10)
        }
            .background(Color.lightBackgroundColor)
            .cornerRadius(15)
    }

    
    struct TopOfPost: View {
        @ObservedObject var imageLoader: ImageLoader
        var userName: String = ""
        var time: Int = 0
        init(imageURL: String, userName: String, time: Int) {
            imageLoader = ImageLoader(urlString: imageURL)
            self.userName = userName
            self.time = time
        }
        
        var body: some View {
            HStack {
                Image(uiImage: imageLoader.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 35, height: 35, alignment: .center)
                    .cornerRadius(17)
                    .padding(.leading, 20)
                VStack(alignment: .leading) {
                    Text(userName)
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    Text("\(time) minutes ago")
                        .fontWeight(.regular)
                        .font(.system(size: 10))
                        .foregroundColor(Color.labelColor)
                }
                    .padding(.leading, 10)
                Spacer()
                Button(action: {}) {
                    Image("ic_sent")
                }
                    .frame(width: 25, height: 25, alignment: .center)
                Button(action: {}) {
                    Image("ic_option")
                }
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(.trailing, 20)
            }
        }
    }

    struct MainPost: View {
        @ObservedObject var imageLoader: ImageLoader
        var likeCount: String = ""
        let height: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 295 : 595
        init(postImageURL: String, likeCount: [Like]?) {
            imageLoader = ImageLoader(urlString: postImageURL)
            self.likeCount = "\(likeCount?.count ?? 0)"
        }
        
        var body: some View {
            ZStack(alignment: .bottom) {
                Image(uiImage: imageLoader.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: .infinity, height: height, alignment: .center)
                    .cornerRadius(17)
                HStack {
                    Button(action: {}) {
                        Image("ic_like")
                    }
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(Color(UIColor(hex: "#FC0B7B")))
                        .cornerRadius(15)
                    HStack {
                        Text(likeCount)
                            .fontWeight(.semibold)
                            .font(.system(size: 8))
                            .padding(15)
                    }
                        .frame(height: 20, alignment: .center)
                        .background(Color(UIColor(hex: "#FFFFFF", alpha: 0.5)))
                        .cornerRadius(10)
                    Spacer()
                    Button(action: {}) {
                        Image("ic_post_message")
                    }
                        .frame(width: 30, height: 30, alignment: .center)
                    .background(Color.lightBackgroundColor)
                        .cornerRadius(15)
                }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
            }
                .padding(.horizontal, 10)
        }
    }
    
    struct BottomOfPost: View {
        var firstLikeNameOfComment: String = ""
        var totalLikeCount: Int = 0
        var ownerNameValue: String = ""
        var ownerCommentValue: String = ""
        var totalCommentCount: Int = 0
        var lastNameValue: String = ""
        var lastCommentValue: String = ""
        
        init(firstOwnerNameOfLike: String, totalLikeCount: Int, ownerNameValue: String, ownerCommentValue: String, totalCommentCount: Int, lastNameValue: String, lastCommentValue: String) {
            self.firstLikeNameOfComment = firstOwnerNameOfLike
            self.totalLikeCount = totalLikeCount
            self.ownerNameValue = ownerNameValue
            self.ownerCommentValue = ownerCommentValue
            self.totalCommentCount = totalCommentCount
            self.lastNameValue = lastNameValue
            self.lastCommentValue = lastCommentValue
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                likes()
                    .padding(.bottom, 1)
                ownerComment()
                    .padding(.bottom, 1)
                seeAllComment()
                    .padding(.bottom, 1)
                lastComment()
            }
                .padding(.horizontal, 25)
        }
        
        func likes() -> some View {
            HStack {
                Text((firstLikeNameOfComment))
                    .fontWeight(.semibold)
                    .font(.system(size: 10))
                Text("and \(totalLikeCount) People liked")
                    .fontWeight(.regular)
                    .font(.system(size: 9))
                Spacer()
            }
        }
        
        func ownerComment() -> some View {
            HStack {
                Text(ownerNameValue)
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                Text(ownerCommentValue)
                    .fontWeight(.semibold)
                    .font(.system(size: 10))
            }
        }
        
        
        func seeAllComment() -> some View {
            Button(action: {}) {
                Text("See all \(totalCommentCount) comments")
                    .fontWeight(.regular)
                    .font(.system(size: 10))
                    .foregroundColor(Color.labelColor)
            }
        }
        
        func lastComment() -> some View {
            HStack {
                Text(lastNameValue)
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                Text(lastCommentValue)
                    .fontWeight(.semibold)
                    .font(.system(size: 10))
            }
        }
    }
}

#if instagramClone
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
#endif
