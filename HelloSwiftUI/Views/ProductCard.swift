//
//  ProductCard.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 23/1/25.
//

import SwiftUI

struct ProductCard: View {
  var maxHeight: CGFloat

  var body: some View {
    VStack {
      Image("matchbox")
        .resizable()
        .scaledToFill()
        .frame(maxHeight: maxHeight)
        .clipShape((RoundedRectangle(cornerRadius: 4)))
      HStack {
        Text("Porsche")
          .fontWeight(.bold)
        Spacer()
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ProductCard(maxHeight: 150)
}
