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
    TabView {
      BrickView()
        .tabItem {
          Label("Brick", systemImage: "book")
        }
      WishlistView()
        .tabItem {
          Label("Wishlist", systemImage: "book")
        }
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
