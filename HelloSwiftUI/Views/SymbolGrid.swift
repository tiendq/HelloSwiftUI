//
//  ColorGrid.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 9/19/24.
//

import SwiftUI

struct SFSymbol : Identifiable, Equatable {
  var id = UUID()
  var name = ""
}

struct SymbolGrid: View {
  static let initialColumns = 3

  @State var gridLayout = Array(repeating: GridItem(.flexible()), count: initialColumns)
  @State private var isAddingSymbol = false
  @State private var isEditing = false
  @State private var columnCount = initialColumns
  @State private var selectedSymbol: SFSymbol?

  @State var symbols = [
    SFSymbol(name: "tshirt"),
    SFSymbol(name: "eyes"),
    SFSymbol(name: "eyebrow"),
    SFSymbol(name: "nose"),
    SFSymbol(name: "mustache"),
    SFSymbol(name: "mouth"),
    SFSymbol(name: "eyeglasses"),
    SFSymbol(name: "facemask"),
    SFSymbol(name: "brain.head.profile"),
    SFSymbol(name: "brain"),
    SFSymbol(name: "icloud"),
    SFSymbol(name: "theatermasks.fill")
  ]

  var body: some View {
    VStack {
      if isEditing {
        Stepper("Columns", value: $columnCount, in: 1...6, step: 1) { _ in
          withAnimation { gridLayout = Array(repeating: GridItem(.flexible()), count: columnCount) }
        }
        .padding()
      }

      ScrollView {
        LazyVGrid(columns: gridLayout) {
          ForEach(symbols) { symbol in
            NavigationLink(destination: SFSymbolView(symbol: symbol)) {
              ZStack(alignment: .topTrailing) {
                Image(systemName: symbol.name)
                  .resizable()
                  .scaledToFit()
                  .symbolRenderingMode(.hierarchical)
                  .foregroundStyle(.tint)
                  .ignoresSafeArea(.container, edges: .bottom)
                  .cornerRadius(8)

                if isEditing {
                  Rectangle()
                    .scaledToFit()
                    .foregroundStyle(.black.opacity(0.1))
                    .onTapGesture {
                      print("Tapped, navigation link disabled")
                    }

                  Button {
                    guard let index = symbols.firstIndex(of: symbol) else { return }

                    withAnimation {
                      _ = symbols.remove(at: index)
                    }
                  } label: {
                    Image(systemName: "xmark.circle.fill")
                      .font(.title)
                      .symbolRenderingMode(.palette)
                      .foregroundStyle(.white, Color.red)
                  }
                  .offset(x: 10, y: -10)
                }
              }
              .padding()
            }
          }
        }
      }
      .navigationTitle("My Symbols")
      .navigationBarTitleDisplayMode(.inline)
      .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
        SFSymbolPickerView(symbol: $selectedSymbol)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(isEditing ? "Done" : "Edit") {
            withAnimation { isEditing.toggle() }
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isAddingSymbol = true
          } label: {
            Image(systemName: "plus")
          }
          .disabled(isEditing)
        }
      }
    }
    .padding(10)
  }

  func addSymbol() {
    guard let symbol = selectedSymbol else { return }

    withAnimation {
      symbols.insert(symbol, at: 0)
    }
  }
}

#Preview {
  NavigationStack {
    SymbolGrid()
  }
}
