//
//  StatHighlightTile.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct StatHighlightTile: View {

    let emoji: String
    let label: String
    let value: String

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.xxs) {

            Text(emoji)
                .font(.system(size: 18))

            Text(label.uppercased())
                .font(AppFont.label)
                .foregroundStyle(AppColors.Text.tertiary)

            Text(value)
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Text.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.sm)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
    }
}

#Preview {
    HStack(spacing: Spacing.sm) {
        StatHighlightTile(emoji: "🏆", label: "Most reliable", value: "Aysel")
        StatHighlightTile(emoji: "🫠", label: "Most flaky", value: "Tural")
    }
    .padding()
    .background(AppColors.Background.subtle)
}
