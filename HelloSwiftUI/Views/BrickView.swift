//
//  BrickView.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 8/7/24.
//

import SwiftUI
import SwiftData

struct BrickView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]

  var imageName: String {
    "sun.max.fill"
  }

  var body: some View {
    NavigationSplitView {
      List {
        ForEach(items) { item in
          NavigationLink {
            HStack {
              Image(systemName: imageName)
                .scaleEffect(2.0)
                .font(.largeTitle)
                .foregroundStyle(Color.yellow)
              Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
            }
          } label: {
            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
              .padding()
              .background(Color.yellow)
          }
          .swipeActions {
            Button(role: .destructive) {
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
        }
        .onDelete(perform: deleteItems)
      }
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          EditButton()
        }
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    } detail: {
      Text("Select an item")
    }
  }
  private func addItem() {
    withAnimation {
      let newItem = Item(timestamp: Date())
      modelContext.insert(newItem)
    }
  }
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(items[index])
      }
    }
  }
}

#Preview {
  BrickView()
    .modelContainer(for: Item.self, inMemory: true)
}
