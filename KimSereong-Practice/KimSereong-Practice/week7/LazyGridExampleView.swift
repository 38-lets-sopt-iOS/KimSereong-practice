//
//  LazyGridExampleView.swift
//  SOPT38_week7
//
//  Created by 김세령 on 5/23/26.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { index in
                    VStack {
                        Rectangle()
                            .fill(Color.cyan)
                            .frame(height: 100)
                            .cornerRadius(10)
                        
                        Text("아이템 \(index)")
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}


#Preview {
    LazyVGridExampleView()
}
