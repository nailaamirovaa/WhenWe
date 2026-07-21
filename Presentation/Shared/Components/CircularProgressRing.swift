//
//  CircularProgressRing.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct CircularProgressRing: View {

    let progress: Double
    var color: Color = AppColors.Brand.primary

    var body: some View {

        ZStack {

            Circle()
                .stroke(AppColors.Border.default, lineWidth: 5)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

#Preview {
    CircularProgressRing(progress: 0.6)
        .frame(width: 34, height: 34)
        .padding()
}
