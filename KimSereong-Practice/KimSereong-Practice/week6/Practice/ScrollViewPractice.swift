//
//  ScrollView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct ScrollViewPractice: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }

            .frame(maxWidth: .infinity)
        }
    }
}

#Preview{
    ScrollViewPractice()
}
