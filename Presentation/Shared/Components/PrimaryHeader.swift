//
//  PrimaryHeader.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct PrimaryHeader: View {
    
    var title: String
    var onBack: () -> Void
    
    var body: some View {
        HStack(spacing: Spacing.xs) {
            
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(AppColors.Text.primary)
                    .frame(width: 32, height: 32)
                    .background(.white)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)

            Text(title)
                .font(AppFont.title2)
                .foregroundStyle(AppColors.Text.primary)
            
            Spacer()
        }
    }
}
