//
//  CustomTabView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct CustomTabView: View {
    //サイドメニューで選択しているTabを判別するために使う状態変数の値をMainViewと共有する
    @Binding var currentTab: String
    // サイドメニューの表示非表示を管理する状態変数の値をMainViewと共有する
    @Binding var showMenu: Bool
    
    var body: some View{
        VStack{
            // Static Header View for all Pages...
            HStack{
                // Menu Button...
                Button{
                    // Toggling Menu Option
                    withAnimation(.spring()){
                        showMenu = true
                    }
                }label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(.white)
                }// Button
                // Hiding When Menu is Visible...
                .opacity(showMenu ? 0 : 1)
                Spacer()
                Button{
                    // Toggling Menu Option
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }label: {
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                }
            }// HStack
            .overlay(
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                // Same Hiding When Menu is Visible...
                    .opacity(showMenu ? 0 :1)
            )
            .padding([.horizontal,.top])
            .padding(.bottom,8)
            .padding(.top,getSafeArea().top)
            
            TabView(selection: $currentTab){
                HomeView()
                    .tag("Home")
                // Repalace Your Custom Views here...
                Text("Discover")
                    .tag("Discover")
                
                Text("Devices")
                    .tag("Devices")
                
                Text("Profile")
                    .tag("Profile")
            }// TabView
        }// VStack
        // Disabling actions when menu is visible...
        // サイドメニューを表示している間(showMenu == true)は、
        //HomeViewのScrolloview(スクロール操作)を無効にする
        .disabled(showMenu)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // .overlayはViewの上にViewを重ねることが出来るメソッド
        .overlay(
            // Close Button...
            Button{
                // Toggling Menu Option
                withAnimation(.spring()){
                    showMenu = false
                }
            }label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
            }// Button
            // Hiding When Menu is Visible...
                .opacity(showMenu ? 1 : 0)
                .padding()
                .padding(.top)
            
            ,alignment: .topLeading
        )
        .background(Color.black)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
