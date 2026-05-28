//
//  ChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct ChatListView: View {
        let chatLists: [ChatListModel]
        
        var body: some View {
            List(chatLists) { chatList in
                ChatView(chatList: chatList)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.visible)
            }
            .listStyle(.plain)
        }
    }
