//
//  SearchSection.swift
//  instagramClone
//
//  Created by Sinan Özman on 12.01.2021.
//

import Foundation
import SwiftUI

struct SearchSection: View {
    @State private var name: String = ""
    var body: some View {
        HStack {
            Text("Explorer")
                .fontWeight(.bold)
                .font(.system(size: 23))
                .foregroundColor(Color(UIColor.init(hex: "#31323B")))
                .padding(.leading, 15.0)
            Spacer()
            searchTextField()
                .background(Color.white)
                .padding(.trailing, 15.0)
        }
    }
    func searchTextField() -> some View {
        HStack() {
            Image("ic_search")
                .padding([.leading], 9.0)
                
            TextField("", text: $name)
        }
        .frame(width: 184, height: 25)
        .cornerRadius(17)
        .overlay(
            RoundedRectangle(cornerRadius: 17)
                .stroke(Color.gray, lineWidth: 0.7)
        )
    }
}
