//
//  AppTextField.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

struct AppTextField: View {
    
    let placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool 
    
    var body: some View {
        TextField("", text: $text)
            .font(AppFont.caption)
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, Spacing.sm)
            .focused($isFocused)
            .foregroundStyle(AppColors.Text.primary)
            .background(isFocused ? .white : .gray.opacity(0.1))
            .clipShape(
                RoundedRectangle(cornerRadius: Radius.small)
            )
            .overlay {
                RoundedRectangle(cornerRadius: Radius.small)
                    .stroke(isFocused ? AppColors.Brand.primary : .clear, lineWidth: 1.5)
                
            }
            .overlay(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.tertiary)
                        .padding(.horizontal, Spacing.md)
                        .allowsHitTesting(false)
                }
            }
            .tint(AppColors.Brand.primary)
    }
}
