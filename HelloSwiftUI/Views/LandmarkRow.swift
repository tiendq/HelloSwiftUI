//
//  LandmarkRow.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 12/23/20.
//

import SwiftUI

/*extension View {
  func print(_ value: Any) -> Self {
    Swift.print(value)
    return self
  }
}*/

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
      Text(landmark.name)
      Spacer()
      
      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
      }
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = LandmarkData().landmarks
  static var previews: some View {
    LandmarkRow(landmark: landmarks[0])
      .previewLayout(.sizeThatFits)
  }
}
