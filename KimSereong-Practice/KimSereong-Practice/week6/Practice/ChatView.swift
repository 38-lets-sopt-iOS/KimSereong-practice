//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    
    let chatList: ChatListModel
    
    var body: some View {
        HStack {
            Image(chatList.profileImage)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
                .clipShape(Circle())
            
            VStack(alignment:.leading) {
                HStack(spacing: 4) {
                    Text(chatList.name).bold(true)
                        
                    Text(chatList.location).opacity(0.5).font(Font.system(size: 13))
                }
                Text(chatList.lastMessage).font(Font.system(size: 15))
            }
            
            Spacer()
                .frame(width: 150)
            
            Image(chatList.productImage)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .padding()
    }
}
