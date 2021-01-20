//
//  ContentView.swift
//  instagramClone
//
//  Created by Sinan Özman on 12.01.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
            VStack {
                RefreshableScrollView(refreshing: $viewModel.storyLoading) {
                    StoryView(viewModel: viewModel)
                        .padding(.bottom, 5)
                    SearchSection()
                        .padding(.bottom, 15)
                    VStack(spacing: 25) {
                        if let data: [Post] = viewModel.post {
                            ForEach(data, id: \.self)  {
                                PostView(post: $0)
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                }
            }.background(Color(UIColor(hex: "#F5F6FA")))
    }
    
    func leadingItem() -> some View {
        HStack {
            Button(action: {}) {
                Image("ic_new")
            }
        }
    }

    func trailingItem() -> some View {
        HStack {
            Button(action: {}) {
                Image("ic_message")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
