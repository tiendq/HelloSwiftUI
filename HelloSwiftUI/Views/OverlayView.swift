import SwiftUI

// Ref: https://fatbobman.com/en/posts/in-depth-exploration-of-overlay-and-background-modifiers-in-swiftui/

struct OverlayView: View {
  var blueRectangle: some View {
    Rectangle()
      .foregroundStyle(.blue)
      .frame(width: 150, height: 150)
  }

  var yellowCircle: some View {
    Circle()
      .foregroundStyle(.yellow)
      .frame(width: 80, height: 80)
  }

  var redRectangle: some View {
    Rectangle()
      .foregroundStyle(.red)
      .frame(width: 150, height: 150)
  }

  var body: some View {
    HStack(alignment: .bottom, spacing: 0) {
      blueRectangle
        .overlay(alignment: .topTrailing) {
          yellowCircle
            .alignmentGuide(.top) { $0[.top] + $0.height / 2 }
            .alignmentGuide(.trailing) { $0[.trailing] - $0.width / 2 }
        }
      redRectangle
    }
    HStack(alignment: .bottom, spacing: 0) {
      ZStack(alignment: .topTrailing) {
        blueRectangle
        yellowCircle
          .alignmentGuide(.top) { $0[.top] + $0.height / 2 }
          .alignmentGuide(.trailing) { $0[.trailing] - $0.width / 2 }
      }
      redRectangle
    }
  }
}

#Preview {
  OverlayView()
}
