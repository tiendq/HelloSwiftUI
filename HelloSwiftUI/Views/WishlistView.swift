//
//  WishlishView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 8/7/24.
//

import SwiftUI

struct WishlistView: View {
  var body: some View {
    AsyncImage(url: URL(string: "https://i1.haypley.vn/2022/10/29/lego-76908-lamborghini-countach-0-68e62c01.jpg")) { image in image.resizable().aspectRatio(contentMode: .fit)
    } placeholder: {
      ProgressView()
    }
    .frame(width: 196, height: 196)
  }
}

#Preview {
  WishlistView()
}
