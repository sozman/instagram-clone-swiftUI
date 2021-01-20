//
//  SearchCategoriesView.swift
//  instagramClone
//
//  Created by Sinan Özman on 17.01.2021.
//

import SwiftUI
import UIKit

struct SearchCategoriesView: View {
    var categories: [SearchCategoryModel]?
    
    init(categories: [SearchCategoryModel]?) {
        self.categories = categories
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if let data: [SearchCategoryModel] = categories {
                    ForEach(data, id: \.self) {
                        items(image: $0.logoImage ?? "", title: $0.title ?? "", color: $0.backgroundColor ?? "")
                            .cornerRadius(15)
                    }
                }
            }.padding(.horizontal, 10)
        }.padding(.top, 10)
    }
    
    private func items(image: String, title: String, color: String) -> some View {
        VStack {
            Spacer()
            Image(image)
                .padding(.top, 10)
            Spacer()
            Text(title)
                .fontWeight(.bold)
                .font(.system(size: 10))
                .foregroundColor(Color.white)
                .padding(.horizontal, 25)
                .padding(.bottom, 20)
        }
        .frame(width: 89, height: 103, alignment: .center)
        .background(Color(UIColor(hex: color)))
    }
}

struct SearchCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoriesView(categories: [SearchCategoryModel]())
    }
}
