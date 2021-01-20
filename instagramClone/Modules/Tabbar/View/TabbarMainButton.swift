//
//  TabbarMainButton.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import Foundation
import SwiftUI

struct TabbarMainButton: View {
    let widthAndHeigh: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeigh, height: widthAndHeigh)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeigh, height: widthAndHeigh)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeigh, height: widthAndHeigh)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeigh, height: widthAndHeigh)
                    .foregroundColor(.white)
            }
        }
        .transition(.scale)
    }
}
