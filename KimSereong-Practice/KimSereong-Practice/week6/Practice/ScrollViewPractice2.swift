//
//  ScrollViewPractice2.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct ScrollViewPractice2: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(1..<100) {
                    Text("숫자 \($0)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview{
    ScrollViewPractice2()
}
