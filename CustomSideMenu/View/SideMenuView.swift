//
//  SideMenuView.swift
//  CustomSideMenu
//
//  Created by nakamura motoki on 2022/02/19.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var currentTab: String
    
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
            // Tab Buttons...
            VStack(alignment: .leading, spacing: 25){
                
            }// VStack
            .padding()
            .padding(.top, 60)
        }// VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
