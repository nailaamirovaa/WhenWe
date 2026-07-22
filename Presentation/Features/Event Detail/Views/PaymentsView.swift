//
//  PaymentsView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct PaymentsView: View {

    @Environment(\.dismiss) private var dismiss

    private let payments = EventPayments.sample
    private let inkColor = Color(red: 0x17 / 255, green: 0x15 / 255, blue: 0x1F / 255)

    private var paidPayers: [Payer] { payments.payers.filter(\.isPaid) }
    private var unpaidPayers: [Payer] { payments.payers.filter { !$0.isPaid } }

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: Spacing.md) {

                header

                summaryCard

                sectionLabel("PAID · \(payments.paidCount)", color: AppColors.Semantic.going)

                card(for: paidPayers) { payer in
                    PayerRow(payer: payer, amountLabel: "\(payments.currencySymbol)\(payments.amountPerPlayer)", onNudge: {})
                }

                sectionLabel("NOT PAID · \(payments.unpaidCount)", color: AppColors.Semantic.notGoing)

                card(for: unpaidPayers) { payer in
                    PayerRow(payer: payer, onNudge: {})
                }
            }
            .padding(Spacing.screenPadding)
            .padding(.top, Spacing.xxl)
        }
        .ignoresSafeArea()
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }

    private var header: some View {

        HStack(spacing: Spacing.sm) {

            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(AppColors.Text.primary)
                    .frame(width: 40, height: 40)
                    .background(AppColors.Background.card)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.06), radius: 16, y: 6)
            }
            .buttonStyle(.plain)

            Text("Payments")
                .font(AppFont.title2)
                .foregroundStyle(AppColors.Text.primary)

            Text("PRO")
                .font(AppFont.label)
                .foregroundStyle(AppColors.Brand.primary)
                .padding(.horizontal, Spacing.xs)
                .frame(height: 20)
                .background(AppColors.Brand.soft)
                .clipShape(Capsule())
        }
        .padding(.top, Spacing.lg)
    }

    private var summaryCard: some View {

        HStack(spacing: Spacing.md) {

            Text("💰")
                .font(.system(size: 22))
                .frame(width: 44, height: 44)
                .background(AppColors.Semantic.going.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))

            VStack(alignment: .leading, spacing: 2) {

                Text("\(payments.currencySymbol)\(payments.collected) / \(payments.currencySymbol)\(payments.total)")
                    .font(.system(size: 18, weight: .heavy))
                    .monospacedDigit()
                    .foregroundStyle(AppColors.Text.primary)

                Text("\(payments.paidCount) of \(payments.totalCount) players paid")
                    .font(AppFont.caption.bold())
                    .foregroundStyle(AppColors.Semantic.going)
            }

            Spacer()

            Button(action: {}) {
                Text("Remind \(payments.unpaidCount)")
                    .font(.system(size: 13, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, Spacing.sm)
                    .frame(height: 34)
                    .background(AppColors.Brand.primary)
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private func sectionLabel(_ text: String, color: Color) -> some View {

        HStack(spacing: Spacing.xs) {
            Circle().fill(color).frame(width: 8, height: 8)

            Text(text)
                .font(AppFont.label)
                .foregroundStyle(AppColors.Text.secondary)
        }
    }

    private func card(for payers: [Payer], @ViewBuilder row: @escaping (Payer) -> some View) -> some View {

        VStack(spacing: 0) {

            ForEach(payers) { payer in

                row(payer)

                if payer.id != payers.last?.id {
                    Divider()
                }
            }
        }
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
    }
}
