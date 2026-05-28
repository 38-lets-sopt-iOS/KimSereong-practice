//
//  ChatMessageView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct ChatMessageView: View {
    let user: ChatUser
    @Binding var isActive: Bool

    var body: some View {
        HStack(spacing: 18) {
            ProfileImage(isActive: isActive, size: 64, statusSize: 15)

            VStack(alignment: .leading, spacing: 6) {
                Text(user.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.black)

                Text(user.message)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.gray)
            }

            Spacer()

            Text("오전 9:41")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.gray.opacity(0.5))
        }
        .padding(.vertical, 25)
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(
            user: ChatUser(name: "나연", message: "듀듀듀"),
            isActive: .constant(true)
        )
        .padding()
    }
}
