//
//  CircleImage.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 12/23/20.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  var body: some View {
    image.resizable()
      .frame(width: 250, height: 250)
      .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 7)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(image: Image("turtlerock"))
  }
}
