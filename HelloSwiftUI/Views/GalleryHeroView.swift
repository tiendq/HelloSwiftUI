//
//  ScrollView.swift
//  HelloSwiftUI
//
//  Created by TIEN DO on 3/2/25.
//

import SwiftUI

// Ref: https://developer.apple.com/videos/play/wwdc2023/10159/
struct Palette: Identifiable {
  var id: UUID
  var name: String
}

struct GallerySection<Content: View, Label: View>: View {
  var edge: Edge? = nil

  @ViewBuilder var content: Content
  @ViewBuilder var label: Label

  var halfSpacing: CGFloat {
    sectionSpacing / 2.0
  }

  var sectionSpacing: CGFloat {
    20.0
  }

  var hMargin: CGFloat {
#if os(macOS)
    40.0
#else
    20.0
#endif
  }

  var body: some View {
    VStack(alignment: .leading) {
      label
        .font(.title.bold())
      content
    }
    .padding(.top, halfSpacing)
    .padding(.bottom, sectionSpacing)
    .overlay(alignment: .bottom) {
      if edge != .bottom {
        Divider().padding(.horizontal, hMargin)
      }
    }
  }
}

struct GalleryHeroHeader: View {
  var name: String
  var palettes: [Palette]

  var hMargin: CGFloat {
    20.0
  }

  var body: some View {
    Text(name)
      .padding(.horizontal, hMargin)
  }
}

struct GalleryHeroView: View {
  @Environment(\.horizontalSizeClass) private var sizeClass

  private var columns: Int {
    sizeClass == .compact ? 1 : regularCount
  }

  var stackPadding: CGFloat {
    20.0
  }

  var heroRatio: CGFloat {
    16.0 / 9.0
  }

  var regularCount: Int {
    2
  }

  var hSpacing: CGFloat {
    10.0
  }

  @ViewBuilder
  private var colorStack: some View {
    let offsetValue = stackPadding

    ZStack {
      Color.red
        .offset(x: offsetValue, y: offsetValue)
      Color.blue
      Color.green
        .offset(x: -offsetValue, y: -offsetValue)
    }
    .padding(stackPadding)
    .background()
  }

  var palette: Palette

  var body: some View {
    colorStack
      .aspectRatio(heroRatio, contentMode: .fit)
      .containerRelativeFrame(
        [.horizontal], count: columns, spacing: hSpacing
      )
      .clipShape(.rect(cornerRadius: 20.0))
      .scrollTransition(axis: .horizontal) { content, phase in
        content
          .scaleEffect(
            x: phase.isIdentity ? 1.0 : 0.80,
            y: phase.isIdentity ? 1.0 : 0.80)
      }
  }
}

struct GalleryHeroContent: View {
  var palettes: [Palette]
  @Binding var mainID: Palette.ID?

  var hSpacing: CGFloat {
    10.0
  }

  var hMargin: CGFloat {
    20.0
  }

  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: hSpacing) {
        ForEach(palettes) { palette in
          GalleryHeroView(palette: palette)
        }
      }
      .scrollTargetLayout()
    }
    .contentMargins(.horizontal, hMargin)
    .scrollTargetBehavior(.viewAligned)
    .scrollIndicators(.never)
    .scrollPosition(id: $mainID)
  }
}

struct GalleryHeroSection: View {
  @State var mainID: Palette.ID? = nil
  var palettes: [Palette]

  var body: some View {
    GallerySection(edge: .top) {
      GalleryHeroContent(palettes: palettes, mainID: $mainID)
    } label: {
      GalleryHeroHeader(name: "Featured", palettes: palettes)
    }
  }
}

struct ScrollContentView: View {
  @State var palettes: [Palette] = [
    .init(id: UUID(), name: "Example One"),
    .init(id: UUID(), name: "Example Two"),
    .init(id: UUID(), name: "Example Three"),
  ]

  var body: some View {
    ScrollView {
      GalleryHeroSection(palettes: palettes)
    }
  }
}

#Preview {
  ScrollContentView()
}
