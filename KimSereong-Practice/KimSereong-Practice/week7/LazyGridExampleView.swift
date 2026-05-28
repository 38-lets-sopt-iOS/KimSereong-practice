//
//  LazyGridExampleView.swift
//  SOPT38_week7
//
//  Created by 김세령 on 5/23/26.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(1...20, id: \.self) { index in
                    VStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0.05, green: 0.78, blue: 0.84))
                            .aspectRatio(1.8, contentMode: .fit)
                        
                        Text("아이템 \(index)")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    .padding(.top, 18)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0.0, green: 0.48, blue: 1.0))
                    )
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
        }
        .background(Color.white)
    }
}


#Preview {
    LazyVGridExampleView()
}
