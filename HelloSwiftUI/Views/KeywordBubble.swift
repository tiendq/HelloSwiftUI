//
//  KeywordBubble.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 8/7/24.
//

import SwiftUI

struct KeywordBubble: View {
  let keyword: String
  let symbol: String

  @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5

  var body: some View {
    Label(keyword, systemImage: symbol)
      .padding(paddingWidth)
      .font(.title)
      .foregroundColor(.white)
      .background(.green.opacity(0.75), in: Capsule())
  }
}

#Preview {
  let keywords = ["chives", "fern-leaf", "lavender"]

  return Group {
    KeywordBubble(keyword: keywords[0], symbol: "leaf")
    KeywordBubble(keyword: keywords[1], symbol: "leaf")
    KeywordBubble(keyword: keywords[2], symbol: "leaf")
  }
}
