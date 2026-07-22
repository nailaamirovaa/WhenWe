//
//  AttendanceRow.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct AttendanceRow: View {

    let entry: AttendanceEntry

    var body: some View {

        HStack(spacing: Spacing.sm) {

            Circle()
                .fill(entry.color)
                .frame(width: 32, height: 32)
                .overlay {
                    Text(entry.initials)
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.white)
                }

            VStack(alignment: .leading, spacing: 5) {

                Text(entry.name)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Text.primary)

                GeometryReader { proxy in
                    Capsule()
                        .fill(AppColors.Background.subtle)
                        .overlay(alignment: .leading) {
                            Capsule()
                                .fill(AppColors.Brand.primary)
                                .frame(width: proxy.size.width * entry.progress)
                        }
                }
                .frame(height: 5)
            }

            Text(entry.fractionLabel)
                .font(.system(size: 13, weight: .heavy))
                .monospacedDigit()
                .foregroundStyle(AppColors.Text.primary)
        }
        .padding(.vertical, Spacing.sm)
    }
}

#Preview {
    VStack(spacing: 0) {
        AttendanceRow(entry: GroupStats.sample.attendance[0])
        Divider()
        AttendanceRow(entry: GroupStats.sample.attendance[1])
    }
    .padding()
}
