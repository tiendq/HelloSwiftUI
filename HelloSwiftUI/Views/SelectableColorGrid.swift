import SwiftUI

struct SelectableColorGrid: View {
  @Environment(\.dynamicTypeSize) var dynamicTypeSize
  @State var selectedColors: [Color] = []

  let columnLayout = Array(repeating: GridItem(), count: 2)
  let allColors: [Color] = [
    .pink,
    .red,
    .orange,
    .yellow,
    .green,
    .mint,
    .teal,
    .cyan,
    .blue,
    .indigo,
    .purple,
    .brown,
    .gray
  ]

  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: columnLayout, pinnedViews: .sectionHeaders) {
          Section {
            ForEach(allColors, id: \.description) { color in
              Button {
                if selectedColors.contains(color) {
                  selectedColors.removeAll(where: { $0 == color })
                } else {
                  selectedColors.append(color)
                }
              } label: {
                ZStack(alignment: .topTrailing) {
                  RoundedRectangle(cornerRadius: 4.0)
                    .scaledToFit()
                    .foregroundStyle(color)

                  if selectedColors.contains(color) {
                    Image(systemName: "checkmark.circle.fill")
                      .font(.title)
                      .foregroundStyle(.white)
                      .offset(x: -10, y: 10)
                  }
                }
              }
            }
          } header: {
            Text("Colors")
              .font(.system(.largeTitle, design: .rounded))
              //.font(.custom("AmericanTypewriter", size: 36, relativeTo: .title))
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
          }
        }
      }
    }
    .padding(10)
  }
}

#Preview {
  NavigationStack {
    SelectableColorGrid()
  }
}
