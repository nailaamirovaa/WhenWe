//
//  TertiaryButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct TertiaryButton: View {

    let title: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {
            Text(title)
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Brand.primary)
        }
        .buttonStyle(.plain)
    }
}
