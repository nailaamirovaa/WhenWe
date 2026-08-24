//
//  ToggleRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct ToggleRow: View {
    var title: String
    var subtitle: String
    @Binding var isOn: Bool 
    var isPro: Bool = false
    
    var body: some View {
        HStack {

            VStack(alignment: .leading, spacing: 2) {

                HStack(spacing: Spacing.xs) {
                    Text(title)
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    if isPro {
                        proBadge
                    }
                }

                Text(subtitle)
                    .font(AppFont.caption)
                    .foregroundStyle(AppColors.Text.secondary)
            }

            Spacer()

            Toggle("", isOn: $isOn)
                .toggleStyle(CustomToggleStyle())
                .labelsHidden()
                .tint(AppColors.Brand.primary)
        }
        .padding(.horizontal, Spacing.xs)
        .padding(.vertical, Spacing.md)
    }
    
    private var proBadge: some View {

        HStack(spacing: 2) {
            Image(systemName: AppIcons.locked)
                .font(.system(size: 8))
            Text("PRO")
                .font(.system(size: 10, weight: .heavy))
        }
        .foregroundStyle(AppColors.Brand.primary)
        .padding(.horizontal, Spacing.xs)
        .frame(height: 20)
        .background(AppColors.Brand.soft)
        .clipShape(Capsule())
    }
}
