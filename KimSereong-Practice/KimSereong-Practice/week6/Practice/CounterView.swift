//
//  CounterView.swift
//  SOPT-38-SwiftUI
//
//  Created by 김세령 on 5/16/26.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0  // 상위 뷰가 값을 소유

    var body: some View {
        VStack {
            Text("카운트: \(count)")
            CounterButton(count: $count)  // $ 붙여서 Binding으로 전달
        }
    }
}

struct CounterButton: View {
    @Binding var count: Int  // 값을 소유하지 않고 참조만 함

    var body: some View {
        Button("올리기") {
            count += 1  // 상위 뷰의 @State 값을 직접 변경
        }
    }
}


#Preview{
    CounterView()
}
