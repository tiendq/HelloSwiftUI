//
//  Item.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 5/10/24.
//

import Foundation
import SwiftData

@Model
class Item {
  var timestamp: Date

  init(timestamp: Date) {
    self.timestamp = timestamp
  }
}
