//
//  SFSymbolPickerView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 9/19/24.
//

import SwiftUI

struct SFSymbolPickerView: View {
  @Binding var symbol: SFSymbol?

  var body: some View {
    SFSymbolView(symbol: symbol ?? SFSymbol(name: ""))
  }
}

#Preview {
  SFSymbolPickerView(symbol: .constant(SFSymbol(name: "clock")))
}
