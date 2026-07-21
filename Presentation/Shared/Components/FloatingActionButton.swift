//
//  FloatingActionButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct FloatingActionButton: View {

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Image(systemName: AppIcons.plus)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(AppColors.Brand.primary)
                .clipShape(Circle())
                .shadow(color: AppColors.Brand.primary.opacity(0.35), radius: 16, y: 8)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    FloatingActionButton(action: {})
        .padding()
}
