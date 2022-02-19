//
//  MainView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct MainView: View {
    // Current Tab...
    @State var currentTab: String = "Home"
    var body: some View {
        ZStack{
            // Custom Side Menu...
            SideMenuView(currentTab: $currentTab)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
