//
//  ShimmerModifier.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

struct ShimmerModifier: ViewModifier {

    @State private var moveToRight = false

    func body(content: Content) -> some View {

        content
            .overlay {
                GeometryReader { geometry in

                    LinearGradient(
                        colors: [
                            .clear,
                            .white.opacity(0.35),
                            .clear
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .rotationEffect(.degrees(20))
                    .offset(x: moveToRight ? geometry.size.width * 2 : -geometry.size.width * 2)
                    .frame(width: geometry.size.width)
                }
                .mask(content)
            }
            .onAppear {

                withAnimation(
                    .linear(duration: 1.2)
                    .repeatForever(autoreverses: false)
                ) {
                    moveToRight = true
                }
            }
    }
}