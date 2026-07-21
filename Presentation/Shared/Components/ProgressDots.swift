//
//  ProgressDots.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct ProgressDots: View {

    let total: Int
    let current: Int

    var body: some View {

        HStack(spacing: 6) {

            ForEach(0..<total, id: \.self) { index in

                Capsule()
                    .fill(index < current ? AppColors.Brand.primary : AppColors.Border.default)
                    .frame(width: 24, height: 4)
            }
        }
    }
}

#Preview {
    ProgressDots(total: 4, current: 2)
        .padding()
}
