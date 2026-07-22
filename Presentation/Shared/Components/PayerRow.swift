//
//  PayerRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct PayerRow: View {

    let payer: Payer
    var amountLabel: String = ""
    let onNudge: () -> Void

    var body: some View {

        HStack(spacing: Spacing.sm) {

            Circle()
                .fill(payer.color)
                .frame(width: 34, height: 34)
                .overlay {
                    Text(payer.initials)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white)
                }

            Text(payer.name)
                .font(AppFont.bodyStrong)
                .foregroundStyle(AppColors.Text.primary)

            Spacer()

            if payer.isPaid {

                Text("\(amountLabel) ✓")
                    .font(.system(size: 13, weight: .heavy))
                    .foregroundStyle(AppColors.Semantic.going)

            } else {

                Button(action: onNudge) {
                    Text("Nudge")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundStyle(AppColors.Semantic.maybe)
                        .padding(.horizontal, Spacing.sm)
                        .frame(height: 28)
                        .background(AppColors.Semantic.maybe.opacity(0.15))
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, Spacing.md)
        .padding(.vertical, Spacing.sm)
    }
}

#Preview {
    VStack(spacing: 0) {
        PayerRow(payer: EventPayments.sample.payers[0], amountLabel: "₼5", onNudge: {})
        Divider()
        PayerRow(payer: EventPayments.sample.payers[4], onNudge: {})
    }
    .padding()
}
