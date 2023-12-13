//
//  ContentView.swift
//  Vertical&HorizontalImageParallaxInSwift
//
//  Created by test on 13.12.2023.
//

import SwiftUI

struct ContentView: View {
    var images = ["swift", "apple.logo", "apple.terminal", "applewatch.side.right", "homepod.and.appletv"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(images, id: \.self) { item in
                    GeometryReader { geo in
                        Image(systemName: item)
                            .resizable()
                            .scaledToFit()
                            .offset(x: calculateOffset(scrollOffset: geo.frame(in: .global).minX))
                            .frame(width: 200, height: 350)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .scrollTransition(axis: .horizontal) { image, phase in
                                image.scaleEffect(phase.isIdentity ? 1 : 0.8)
                            }
                    }
                    .frame(width: 200, height: 350)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(20)
        .scrollTargetBehavior(.viewAligned)
    }
    
    func calculateOffset(scrollOffset: CGFloat) -> CGFloat {
        let adjustedOffset = scrollOffset / 5
        return adjustedOffset
    }
}

#Preview {
    ContentView()
}
