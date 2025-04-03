//
//  Background.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 5/24/24.
//

import SwiftUI

struct Background: View {
  var body: some View {
    TabView {
      Text("One")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
        .background(Color.pink, ignoresSafeAreaEdges: .all)
        .font(.largeTitle)
        .tabItem {
          Label("One", systemImage: "sun.max.fill")
        }
      ZStack {
        Color.green.ignoresSafeArea()
        Text("Two")
          .font(.largeTitle)
      }
      .tabItem {
        Label("Two", systemImage: "book")
      }
      VStack {
        Text("Three")
          .font(.largeTitle)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.teal)
      .tabItem {
        Label("Three", systemImage: "person")
      }
    }
  }
}

#Preview {
  Background()
}
