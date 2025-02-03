//
//  SFSymbolView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 9/19/24.
//

import SwiftUI

struct SFSymbolView: View {
  var symbol: SFSymbol

  var body: some View {
    VStack {
      Text(symbol.name)
        .font(.system(.largeTitle, design: .rounded))

      Image(systemName: symbol.name)
        .resizable()
        .scaledToFit()
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.tint)
    }
    .padding()
  }
}
#Preview {
  SFSymbolView(symbol: SFSymbol(name: "magnifyingglass"))
}
