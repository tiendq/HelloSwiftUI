//
//  FeaturedView.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 2/2/25.
//

import SwiftUI

struct FeaturedView: View {
  var body: some View {
    ScrollView {
      FeaturedSection(name: "Featured")
      FeaturedSection(name: "Recents")
      FeaturedSection(name: "Most Viewed")
    }
  }
}

#Preview {
  FeaturedView()
}
