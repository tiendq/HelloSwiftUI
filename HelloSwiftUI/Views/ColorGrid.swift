//
//  ColorGrid.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 9/19/24.
//

import SwiftUI

extension Color {
  static var random: Color {
    Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
  }
}

struct ColorGrid: View {
  let columnLayout = Array(repeating: GridItem(), count: 2)
  @State private var selectedColor = Color.black

  // let allColors: [Color] = Array(repeating: Color.random, count: 48)
  let allColors: [Color] = [
    .pink,
    .red,
    .orange,
    .yellow,
    .green,
    .mint,
    .teal,
    .cyan,
    .blue,
    .indigo,
    .purple,
    .brown,
    .gray
  ]

  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: columnLayout, pinnedViews: .sectionHeaders) {
          Section {
            ForEach(allColors, id: \.description) { color in
              Button {
                selectedColor = color
              } label: {
                RoundedRectangle(cornerRadius: 4.0)
                  .scaledToFit()
                  .foregroundStyle(color)
              }
            }
          } header: {
            Text("Colors")
              .foregroundStyle(selectedColor)
              .font(.largeTitle.bold())
              .frame(maxWidth: .infinity, alignment: .leading)
          }
        }
      }
    }
    .padding(10)
  }
}

#Preview {
  NavigationStack {
    ColorGrid()
  }
}
