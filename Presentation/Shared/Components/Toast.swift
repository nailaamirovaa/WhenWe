//
//  ToastStyle.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//


import SwiftUI

enum ToastStyle {
    case success
    case warning
    case error

    var background: Color {
        switch self {
        case .success:
            return AppColors.Semantic.going

        case .warning:
            return AppColors.Semantic.maybe

        case .error:
            return AppColors.Semantic.notGoing
        }
    }

    var icon: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"

        case .warning:
            return "exclamationmark.circle.fill"

        case .error:
            return "xmark.circle.fill"
        }
    }
}

struct Toast: View {

    let title: String
    let style: ToastStyle

    var body: some View {

        HStack(spacing: Spacing.sm) {

            Image(systemName: style.icon)

            Text(title)
                .font(AppFont.bodyStrong)

            Spacer()
        }
        .foregroundStyle(.white)
        .padding(.horizontal, Spacing.md)
        .frame(height: 52)
        .background(style.background)
        .clipShape(
            RoundedRectangle(cornerRadius: Radius.large)
        )
    }
}