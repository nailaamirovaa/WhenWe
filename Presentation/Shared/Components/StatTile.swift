//
//  StatTile.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct StatTile: View {

    let value: String
    let label: String

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.xxs) {

            Text(value)
                .font(.system(size: 26, weight: .heavy))
                .monospacedDigit()
                .foregroundStyle(AppColors.Text.primary)

            Text(label)
                .font(AppFont.caption)
                .foregroundStyle(AppColors.Text.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }
}

#Preview {
    HStack(spacing: Spacing.sm) {
        StatTile(value: "48", label: "games played")
        StatTile(value: "91%", label: "show-up rate")
    }
    .padding()
    .background(AppColors.Background.subtle)
}
