import SwiftUI

// Incomplete, watch it https://www.youtube.com/watch?v=CaSrL-uBEAM

// Custom, better than built-in SwiftUI gesture.
// Ref: https://youtu.be/CaSrL-uBEAM?t=307
struct PanGesture: UIGestureRecognizerRepresentable {
  var handle: (UIPanGestureRecognizer) -> ()

  func makeUIGestureRecognizer(context: Context) -> UIPanGestureRecognizer {
    return UIPanGestureRecognizer()
  }

  func updateUIGestureRecognizer(_ recognizer: UIPanGestureRecognizer, context: Context) {
  }

  func handleUIGestureRecognizerAction(_ recognizer: UIPanGestureRecognizer, context: Context) {
    handle(recognizer)
  }
}

struct PanGestureColorGrid: View {
  @State var allColors: [Color] = []
  @State var selectedColors: [Color] = []
  @State var isSelecting = false
  @State var panGesture: UIPanGestureRecognizer?

  let columnLayout = Array(repeating: GridItem(), count: 3)

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columnLayout) {
        ForEach(allColors, id: \.description) { color in
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
    }
    .onAppear {
      for _ in 0...64 {
        allColors.append(Color.random)
      }
    }
    .onChange(of: isSelecting, { oldValue, newValue in
      panGesture?.isEnabled = newValue
    })
    /*.gesture(PanGesture { gesture in
      if nil == panGesture {
        panGesture = gesture
      }

      let state = gesture.state

      if .began == state || .changed == state {
        onGestureChanged(gesture)
      } else {
        onGestureEnded(gesture)
      }
    })*/
    .navigationTitle("Colors")
    .toolbar {
      ToolbarItem {
        Button(isSelecting ? "Cancel" : "Select") {
          isSelecting.toggle()
        }
      }
    }
    .padding(10)
  }

  func onGestureChanged(_ gesture: UIPanGestureRecognizer) {

  }

  func onGestureEnded(_ gesture: UIPanGestureRecognizer) {

  }
}

#Preview {
  NavigationStack {
    PanGestureColorGrid()
  }
}
