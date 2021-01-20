//
//  TabbarIcon.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import Foundation
import SwiftUI

struct TabbarIcon: View {
    @StateObject var tabbarRouter: TabbarRouter
    let assignedPage: Page
    
    let width: CGFloat
    let height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(tabbarRouter.currentPage != assignedPage ? systemIconName : systemIconName+"_selected")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Spacer()
        }
            .padding(.horizontal, -4)
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
    }
}
