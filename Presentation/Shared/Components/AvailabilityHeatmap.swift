//
//  AvailabilityHeatmap.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct AvailabilityCalendarGrid: View {

    @Binding var selectedDay: Int
    @Binding var selectedHour: Int

    private let days = ["M", "T", "W", "T", "F", "S", "S"]
    private let rowHeight: CGFloat = 34
    private let visibleRows: CGFloat = 3
    private let spacing: CGFloat = 5

    var body: some View {

        VStack(spacing: spacing) {

            HStack(spacing: spacing) {
                ForEach(days.indices, id: \.self) { index in
                    Text(days[index])
                        .font(.system(size: 10, weight: .heavy))
                        .foregroundStyle(AppColors.Text.tertiary)
                        .frame(maxWidth: .infinity)
                }
            }

            ScrollView {
                VStack(spacing: spacing) {
                    ForEach(0..<24, id: \.self) { hour in
                        HStack(spacing: spacing) {
                            ForEach(0..<7, id: \.self) { day in
                                cell(day: day, hour: hour)
                            }
                        }
                    }
                }
            }
            .frame(height: rowHeight * visibleRows + spacing * (visibleRows - 1))
        }
    }

    private func cell(day: Int, hour: Int) -> some View {

        let isSelected = day == selectedDay && hour == selectedHour

        return Button {
            selectedDay = day
            selectedHour = hour
        } label: {
            Text(String(format: "%02d:00", hour))
                .font(.system(size: 8, weight: .heavy))
                .minimumScaleFactor(0.8)
                .lineLimit(1)
                .foregroundStyle(isSelected ? .white : AppColors.Text.secondary)
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
                .background(background(day: day, hour: hour, isSelected: isSelected))
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(color: isSelected ? AppColors.Brand.primary.opacity(0.4) : .clear, radius: 6, y: 2)
        }
        .buttonStyle(.plain)
    }

    private func background(day: Int, hour: Int, isSelected: Bool) -> Color {

        if isSelected { return AppColors.Brand.primary }

        switch level(day: day, hour: hour) {
        case 0: return AppColors.Background.subtle
        case 1: return AppColors.Brand.soft
        default: return Color(red: 0xDC / 255, green: 0xD4 / 255, blue: 0xFB / 255)
        }
    }

    private func level(day: Int, hour: Int) -> Int {
        switch hour {
        case 18...21: return (day + hour) % 3 == 0 ? 2 : 1
        case 12...17: return (day + hour) % 4 == 0 ? 1 : 0
        default: return 0
        }
    }
}

#Preview {
    AvailabilityCalendarGrid(selectedDay: .constant(0), selectedHour: .constant(20))
        .padding()
}
