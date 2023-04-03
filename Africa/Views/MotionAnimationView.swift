//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 03/04/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTY

    @State private var randomCircle = Int.random(in: 12 ... 16)
    @State private var isAnimating: Bool = false

    // MARK: - FUNCTION

    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0 ... max)
    }

    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 100 ... 300)
    }

    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1 ... 2)
    }

    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.25 ... 1.0)
    }

    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0 ... 2)
    }

    // MARK: - BODY

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ... randomCircle, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .scaleEffect(randomScale())
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                            value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                } // FOREACH LOOP
            } //: ZSTACK
            .drawingGroup()
        }
    }
}

// MARK: - PREVIEW

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
