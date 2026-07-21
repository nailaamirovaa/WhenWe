//
//  SecondaryButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct SecondaryButton: View {

    let title: String
    var isEnabled: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Brand.primary)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
        }
        .background(AppColors.Brand.soft)
        .clipShape(
            RoundedRectangle(cornerRadius: Radius.large)
        )
        .buttonStyle(
            SecondaryButtonStyle(isEnabled: isEnabled)
        )
        .disabled(!isEnabled)
    }
}
