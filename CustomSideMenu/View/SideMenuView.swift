//
//  SideMenuView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var currentTab: String
    
    // Adding Smooth Transition between tabs with the help of
    // mathced Geometry Effect...
    @Namespace private var animation
    var body: some View{
        VStack{
            HStack(spacing:15){
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text("iJustine")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }// HStack
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // For Small Screens...
            // getRectメソッドで取得した高さが750以下であればスクロール方向を.verticalにする
            ScrollView(getRect().height < 750 ? .vertical: .init(), showsIndicators: false){
                // Tab Buttons...
                // サイドメニューの一覧を表示する
                VStack(alignment: .leading, spacing: 25){
                    CustomTabButton(icon: "theatermasks.fill", title: "Home")
                    CustomTabButton(icon: "safari.fill", title: "Discover")
                    CustomTabButton(icon: "applewatch", title: "Devices")
                    CustomTabButton(icon: "person.fill", title: "Profile")
                    CustomTabButton(icon: "gearshape.fill", title: "Setting")
                    CustomTabButton(icon: "info.circle.fill", title: "About")
                    CustomTabButton(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    // making Logout as constant button with orange color...
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                    
                    
                }// VStack
                .padding()
                .padding(.top, 60)
            }
            //Max Width of screen width...
            .frame(width: getRect().width / 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }// VStack
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
    }
    
    // Custom Button...
    // サイドメニューに表示するボタンを作成
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) -> some View {
        // ボタンタップ時にアニメーションをかけて、背景などを変える。
        Button{
            if title == "Logout"{
                print("Logout")
            }else{
                withAnimation{
                    currentTab = title
                }
            }
        }label:{
            HStack(spacing: 12){
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil, height: 48)
                    .foregroundColor(currentTab == title ? Color("Purple") : (title == "Logout" ? Color("Orange") : .white))
                    .background(
                        ZStack{
                            if currentTab == title{
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "Logout" ? Color("Orange") :.white)
            }//HStack
            .padding(.trailing,18)
            
            .background(
                ZStack{
                    if currentTab == title{
                        Color("Purple")
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                })
        }// Button
        .offset(x: currentTab == title ? 15 : 0)
    }// CustomTabButtonメソッド
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending View to get Screen Bounds...
extension View{
    func getRect() -> CGRect {
        //SwiftUIで、UIScreenを使うとスクリーンサイズが取得できます。
        //UIScreen.main.boundsはCGRectでsize: CGSizeが入っています。
        //画面サイズを取得するには、UIScreen.main.boundsプロパティが持つ width（幅）とheight（高さ）を参照します。
        return UIScreen.main.bounds
    }
}
