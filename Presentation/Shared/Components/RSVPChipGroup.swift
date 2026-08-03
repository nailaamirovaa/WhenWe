//
//  RSVPChipGroup.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct RSVPChipGroup: View {
    
    let onSelect: (RSVPChoice) -> Void
    let selection: RSVPChoice
    
    var body: some View {
        HStack(spacing: Spacing.sm) {
            ForEach(RSVPChoice.allCases, id: \.self) { choice in
                chip(for: choice)
            }
        }
    }
    
    private func chip(for choice: RSVPChoice) -> some View {
        let isSelected = selection == choice
        
        return Button {
            onSelect(choice)
        } label: {
            Text(choice.title)
                .font(AppFont.bodyStrong)
                .foregroundStyle(isSelected ? .white : AppColors.Text.secondary)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(isSelected ? choice.color : AppColors.Background.card)
                .overlay {
                    Capsule()
                        .stroke(isSelected ? Color.clear : AppColors.Border.default, lineWidth: 1.5)
                }
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
    }
}
