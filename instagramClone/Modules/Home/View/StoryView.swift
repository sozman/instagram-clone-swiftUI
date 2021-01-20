//
//  StoryView.swift
//  instagramClone
//
//  Created by Sinan Özman on 12.01.2021.
//

import Foundation
import SwiftUI
import Combine

struct StoryView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if let data: [Story] = viewModel.story {
                    ForEach(data, id: \.self)  {
                        StoryItemView(name: $0.userName ?? "", image: $0.image)
                    }
                }
            }.padding(10)
        }
    }
}


struct StoryItemView: View {
    @State var name: String = ""
    @State var image: String? = ""
    var body: some View {
        VStack {
            storyImage(image: image)
            Text(name)
                .fontWeight(.regular)
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.init(hex: "#737476")))
        }.frame(width: 80, height: 90, alignment: .center)
    }
}


struct storyImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: String? = ""
    @State var status: Bool = false
    
    init(image: String?) {
        imageLoader = ImageLoader(urlString: image ?? "")
        self.image = image
    }

    var body: some View {
        LazyVStack {
            Image(uiImage: imageLoader.image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(30)
        }
        .frame(width: 70, height: 70, alignment: .center)
        .background(imageLoader.status ? LinearGradient(gradient: Gradient(colors: [Color(UIColor.init(hex: "#FC0B7B")), Color(UIColor.init(hex: "#7820AD"))]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [Color.gray]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(45)
    }
}
