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
    @State var currentTab: String = "Home"
    
    // Menu Option...
    // サイドメニューの表示非表示を管理する状態変数
    @State var showMenu: Bool = false
    
    // Hiding Native Tab Bar...
    // TabViewはデフォルトで画面の下にTabBarを表示するが、今回はサイドメニューを作成しているので非表示にする
    init() {
        //TabBarを非表示にする
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            // Custom Side Menu...
            // サイドメニューを表示する
            SideMenuView(currentTab: $currentTab)
            // Main Tab View
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
            // Appling Corner Radius...
                .cornerRadius(showMenu ? 25 : 0)
            
            // Making 3D rotation...
            // anchorでサイドメニューを半分以上開くようにする
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
            // Moving View Apart
            // getRectメソッドでスクリーンサイズを取得できるので、ボタンタップ時にサイドメニューを、画面の半分になるようにする
                .offset(x: showMenu ? getRect().width / 2 : 0)
            // セーフエリア外まで表示する
                .ignoresSafeArea()
        }
        // Always Dark Mode...
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// Extending View to get Safe Area Values...
extension View{
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
}
