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
        .font(.largeTitle)
        .background(.pink)
        .tabItem {
          Label("One", systemImage: "film.stack")
        }
      ZStack {
        Color.yellow.ignoresSafeArea()
        Text("Two")
          .font(.largeTitle)
      }
      .tabItem {
        Label("Two", systemImage: "film.stack")
      }
      VStack {
        Text("Three")
          .font(.largeTitle)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.teal)
      .tabItem {
        Label("Three", systemImage: "film.stack")
      }
    }
  }
}

#Preview {
  Background()
}
