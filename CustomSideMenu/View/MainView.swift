//
//  MainView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct MainView: View {
    // Current Tab...
    // サイドメニューで選択しているTabを判別するために使う状態変数
    // 
    @State var currentTab: String = "Home"
    var body: some View {
        ZStack{
            // Custom Side Menu...
            SideMenuView(currentTab: $currentTab)
            
            // Main Tab View
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
