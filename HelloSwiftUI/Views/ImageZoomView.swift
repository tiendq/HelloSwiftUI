import SwiftUI
import Zoomable

struct ImageZoomView: View {
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Image("celica")
        .resizable()
        .scaledToFit()
        .border(.white, width: 3.0)
        .zoomable(minZoomScale: 1.0, doubleTapZoomScale: 2.0, outOfBoundsColor: .black)
      Button("Close", systemImage: "xmark.circle") {
        //
      }
      .font(.title)
      .foregroundStyle(.white)
      .labelStyle(.iconOnly)
      .offset(x: -15, y: 15)
    }
    .background(.black, ignoresSafeAreaEdges: .all)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ImageZoomView()
}
