//
//  LandmarkList.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 12/23/20.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var landmarkData: LandmarkData
  @State private var showFavoritesOnly = false
  
  var filteredLandmarks: [Landmark] {
    landmarkData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }
        ForEach (filteredLandmarks) { landmark in
          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .navigationTitle("Landmarks")
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
  }
}
