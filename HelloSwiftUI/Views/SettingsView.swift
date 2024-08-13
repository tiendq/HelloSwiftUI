//
//  SettingsView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 8/7/24.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "folder.badge.plus")
        Image(systemName: "heart.circle.fill")
        Image(systemName: "alarm")
      }
      .symbolRenderingMode(.multicolor)
      .font(.largeTitle)
      ZStack {
        Rectangle()
          .frame(width: 200, height: 160)
          .foregroundStyle(.black)
          .opacity(0.25)
          .padding(.top, 40)
          .background(.orange)
        //{
  //          Rectangle()
  //            .foregroundColor(.blue)
  //        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        Text("Tien")
          .font(.largeTitle)
          .foregroundStyle(.white)
      }
      Image(systemName: "swift")
        .font(.title)
        .padding()
        .foregroundStyle(.white)
        .background(in: Circle())
        .backgroundStyle(.blue.gradient)
      Button() {
      } label: {
        Text("Save")
          .padding()
      }
      .font(.title)
      .buttonStyle(.borderedProminent)
      .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Gradient(colors: gradientColors))
  }
}

#Preview {
  SettingsView()
}
