//
//  FeaturedItem.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 2/2/25.
//

import SwiftUI

struct FeaturedItem: View {
  var color: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 5.0)
      .foregroundStyle(color)
      //.frame(height: 250)
      .aspectRatio(16.0 / 9.0, contentMode: .fit)
      .containerRelativeFrame(.horizontal)
      .scrollTransition(axis: .horizontal) { content, phase in
        content
          .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8, y: phase.isIdentity ? 1.0 : 0.8)
      }
  }
}

#Preview {
  FeaturedItem(color: .blue)
}
