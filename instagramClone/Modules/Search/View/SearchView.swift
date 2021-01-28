//
//  SearchView.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import SwiftUI
import Combine

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel = SearchViewModel()
    @State var name: String = ""
    var body: some View {
        ScrollView {
            VStack {
                SearchCategoriesView(categories: viewModel.searchCategories)
                searchTextField()
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
                ImageGrid(images: viewModel.search)
                    .padding(.top, 25)
                    .padding(.horizontal, 5)
            }
        }
    }
    func searchTextField() -> some View {
        HStack() {
            Image("ic_search")
                .padding([.leading], 9.0)
                
            TextField("Search", text: $name)
            Button(action: {}) {
                Image("ic_qr")
            }.frame(width: 20, height: 20, alignment: .center)
            .padding(.horizontal, 10)
        }
        .frame(height: 40)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.7)
        )
        .background(Color.lightBackgroundColor)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
