//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 5/10/24.
//

import SwiftUI
import SwiftData

let gradientColors: [Color] = [
  .gradientTop,
  .gradientBottom
]

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext

  var body: some View {
    ImageZoomView()
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
