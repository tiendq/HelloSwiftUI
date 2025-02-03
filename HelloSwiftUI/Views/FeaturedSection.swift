//
//  FeaturedSection.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 2/2/25.
//

import SwiftUI

// WWDC23: Beyond scroll views
// Ref: https://www.youtube.com/watch?v=PbyyEQLpX_Y
struct FeaturedSection: View {
  @State var colors: [Color] = []

  var name: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(name)
        .font(.title.bold())

      ScrollView(.horizontal) {
        LazyHStack(spacing: 10.0) {
          ForEach(colors, id: \.description) { color in
            FeaturedItem(color: color)
          }
        }
        .scrollTargetLayout()
      }
      .contentMargins(.horizontal, 20.0)
      .scrollTargetBehavior(.viewAligned)
      .scrollIndicators(.hidden)
      .onAppear {
        for _ in 0...9 {
          colors.append(Color.random)
        }
      }
    }
  }
}

#Preview {
  FeaturedSection(name: "Featured")
}
