//
//  ChatListPracticeView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/28/26.
//

import SwiftUI

struct ChatListPracticeView: View {
    @State private var activeStates: [Bool] = [false, true, true, false, false]

    var body: some View {
        VStack(spacing: 28) {
            StoryScrollView(users: users, activeStates: $activeStates)
                .padding(.top, 24)

            ChatList(users: users, activeStates: $activeStates)
        }
        .padding(.horizontal, 28)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
    }
}

struct ChatList: View {
    let users: [ChatUser]
    @Binding var activeStates: [Bool]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(users.enumerated()), id: \.element.id) { index, user in
                ChatMessageView(user: user, isActive: $activeStates[index])

                if index < users.count - 1 {
                    Divider()
                        .padding(.leading, 88)
                }
            }
        }
    }
}

struct ChatListPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListPracticeView()
    }
}
