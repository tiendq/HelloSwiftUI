//
//  ProductList.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 23/1/25.
//

import SwiftUI

struct ProductList: View {
  let columnLayout = Array(repeating: GridItem(), count: 2)
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        LazyVGrid(columns: columnLayout) {
          ForEach(0...16, id: \.description) { _ in
            NavigationLink(destination: Text("ProductCard")) {
              ProductCard(maxHeight: geometry.size.width / 2 - 30)
            }
          }
        }
      }
      .scrollIndicators(.hidden)
      .padding(10)
    }
  }
}

#Preview {
  NavigationStack {
    ProductList()
  }
}
