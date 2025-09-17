import SwiftUI

// Ref: https://fatbobman.com/en/posts/mastering-the-containerrelativeframe-modifier-in-swiftui/

struct containerRelativeFrame: View {
  var body: some View {
    VStack {
      Image("photo3024x4032")
        .resizable()
        .scaledToFit()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
    .overlay(alignment: .top) {
      Color.blue
        .ignoresSafeArea()
        .containerRelativeFrame(.vertical) { height, axis in
          height * 0.215
        }
    }
    .overlay(alignment: .bottom) {
      Color.orange
        .ignoresSafeArea()
        .containerRelativeFrame(.vertical) { height, axis in
          height * 0.215
        }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  containerRelativeFrame()
}
