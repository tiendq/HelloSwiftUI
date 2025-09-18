import SwiftUI

// Ref: https://fatbobman.com/en/posts/mastering-the-containerrelativeframe-modifier-in-swiftui/
// Notes: layout is only changed for supported orientations in the project settings.

struct containerRelativeFrame: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass

  var isPortrait: Bool {
    verticalSizeClass == .regular && horizontalSizeClass == .compact
  }

  var blueRectangle: some View {
    Color.blue
      .overlay(alignment: .center) {
        Text("top")
          .foregroundStyle(.white)
          .font(.title)
      }
      .ignoresSafeArea()
      .containerRelativeFrame(.vertical) { height, axis in
        height * 0.215
      }
  }

  var orangeRectangle: some View {
    Color.orange
      .overlay(alignment: .center) {
        Text("bottom")
          .foregroundStyle(.white)
          .font(.title)
      }
      .ignoresSafeArea()
      .containerRelativeFrame(.vertical) { height, axis in
        height * 0.215
      }
  }

  var body: some View {
    VStack {
      Image(isPortrait ? "photo3024x4032" : "landscape4032x3024")
        .resizable()
        .scaledToFit()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
    .overlay(alignment: .top) {
      blueRectangle
    }
    .overlay(alignment: .bottom) {
      orangeRectangle
    }
    .ignoresSafeArea()
  }
}

#Preview {
  containerRelativeFrame()
}
