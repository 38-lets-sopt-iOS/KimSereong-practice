//
//  GridView.swift
//  SOPT38_week7
//
//  Created by 김세령 on 5/23/26.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in
                    Color.red
                }
            }.frame(width: 100, height: 100)
            
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in
                    Color.green
                }
            }.frame(width: 100, height: 100)
            
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in
                    Color.blue
                }
            }.frame(width: 100, height: 100)
        }
    }
}

#Preview {
    GridView()
}
