//
//  CustomTabView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var currentTab: String
    
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
                
                Text("Home")
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
        .background(
            Color.black
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
