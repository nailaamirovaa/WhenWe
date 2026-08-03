//
//  PrimaryButton.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var state: PrimaryButtonState = .normal
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: Spacing.sm) {
                if state.showLoadingIndicator {
                    ProgressView()
                        .tint(.textPrimary)
                }
                
                Text(title)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(state.textColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(state.backgroundColor)
            .clipShape(
                RoundedRectangle(cornerRadius: Radius.medium)
            )
        }
        .buttonStyle(ShrinkButtonStyle())
        .disabled(!state.userInteractionEnabled)
    }
}
