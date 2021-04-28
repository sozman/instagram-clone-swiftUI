//
//  Tabbar.swift
//  instagramClone
//
//  Created by Sinan Özman on 16.01.2021.
//

import SwiftUI

struct Tabbar: View {
    
    @StateObject var tabbarRouter: TabbarRouter
    
    @State var showPopup = false
    
    var contentView = ContentView()
    var notificationView = NotificationView()
    var searchView = SearchView()
    var profileView = ProfileView()
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            viewForiOS()
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            viewForiPad()
        }
    }
    
    func viewForiPad() -> some View {
            GeometryReader { geometry in
                ZStack {
                    HStack {
                            VStack(spacing: 5.0) {
                                TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .home, width: geometry.size.width / 28, height: 55, systemIconName: "ic_home", tabName: "Home")
                                    .frame(height: 110.0)
                                TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .records, width: geometry.size.width/28, height: 55, systemIconName: "ic_search_tb", tabName: "Liked")
                                    .frame(height: 110.0)
                                TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .liked, width: geometry.size.width/28, height: 55, systemIconName: "ic_like_tb", tabName: "Records")
                                    .frame(height: 110.0)
                                Spacer()
                                TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .user, width: geometry.size.width/28, height: 55, systemIconName: "ic_user", tabName: "Account")
                                    .frame(height: 110.0)
                                            
                            }
                                .frame(width: geometry.size.width / 10, height: geometry.size.height)
                            .background(Color.lightBackgroundColor)
                        
                        switch tabbarRouter.currentPage {
                        case .home:
                            contentView
                        case .liked:
                            notificationView
                        case .records:
                            searchView
                        case .user:
                            profileView
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/10, height: geometry.size.width/10)
                        .shadow(radius: 4)
                    Image("ic_main_button")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width/11 , height: geometry.size.width/11)
                        .rotationEffect(Angle(degrees: showPopup ? 90 : 0))
                }
        
                .onTapGesture {
                     withAnimation {
//                                 showPopUp.toggle()
                     }
                }
                .offset(x: (geometry.size.width - geometry.size.width/8), y: (geometry.size.height -  geometry.size.height/11))
            }
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image("logo_topbar")
                            }
                        }
                    }.background(Color.backgroundColor)
            .navigationBarItems(leading: leadingItem(), trailing: trailingItem())
    }
    
    func viewForiOS() -> some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    switch tabbarRouter.currentPage {
                    case .home:
                        contentView
                    case .liked:
                        notificationView
                    case .records:
                        searchView
                    case .user:
                        profileView
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .home, width: geometry.size.width / 5, height: geometry.size.height / 28, systemIconName: "ic_home", tabName: "Home")
                            TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "ic_search_tb", tabName: "Liked")
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                                    .shadow(radius: 4)
                                Image("ic_main_button")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                    .rotationEffect(Angle(degrees: showPopup ? 90 : 0))
                            }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                 withAnimation {
    //                                 showPopUp.toggle()
                                 }
                             }
                            TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "ic_like_tb", tabName: "Records")
                            TabbarIcon(tabbarRouter: tabbarRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "ic_user", tabName: "Account")
                                        
                        }
                            .frame(width: geometry.size.width, height: geometry.size.height/10)
                        .background(Color.lightBackgroundColor)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image("logo_topbar")
                            }
                        }
                    }.background(Color.backgroundColor)
            .navigationBarItems(leading: leadingItem(), trailing: trailingItem())
        }
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




struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(tabbarRouter: TabbarRouter())
    }
}
