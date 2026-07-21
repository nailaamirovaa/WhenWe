//
//  ProfileView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {

        VStack(spacing: Spacing.md) {

            Circle()
                .fill(AppColors.Brand.soft)
                .frame(width: 88, height: 88)
                .overlay {
                    Text("N")
                        .font(AppFont.display)
                        .foregroundStyle(AppColors.Brand.primary)
                }
                .padding(.top, Spacing.xxxl)

            Text("Naila Amirova")
                .font(AppFont.title1)
                .foregroundStyle(AppColors.Text.primary)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.Background.subtle)
    }
}

#Preview {
    ProfileView()
}
