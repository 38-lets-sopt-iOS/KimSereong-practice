//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct StoryScrollView: View {
    let users: [ChatUser]
    @Binding var activeStates: [Bool]

    var body: some View {
        HStack(spacing: 12) {
            ForEach(Array(users.enumerated()), id: \.element.id) { index, _ in
                StoryView(isActive: $activeStates[index])
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct StoryView: View {
    @Binding var isActive: Bool

    var body: some View {
        Button {
            isActive.toggle()
        } label: {
            ProfileImage(isActive: isActive, size: 60, statusSize: 13)
        }
        .buttonStyle(.plain)
    }
}

struct ProfileImage: View {
    let isActive: Bool
    let size: CGFloat
    let statusSize: CGFloat

    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(isActive ? Color.blue : Color.gray)
            .frame(width: size, height: size)
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .fill(isActive ? Color.green : Color.gray)
                    .frame(width: statusSize, height: statusSize)
                    .offset(x: size * 0.03, y: size * 0.01)
            }
            .accessibilityLabel(isActive ? "활동중 프로필" : "비활동 프로필")
    }
}
