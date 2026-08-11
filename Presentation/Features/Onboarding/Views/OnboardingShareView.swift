//
//  OnboardingShareView.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct OnboardingShareView: View {

    let viewModel: OnboardingViewModel
    let onFinish: () -> Void

    @State private var showCopiedToast = false

    private var shareMessage: String {
        "Who's in for \(viewModel.groupName.isEmpty ? "the game" : viewModel.groupName)? Tap to answer — takes 5 seconds \(viewModel.activitySelection?.emoji ?? "🎯")"
    }

    private var locationSubtitle: String {
        viewModel.eventLocation.isEmpty
            ? viewModel.selectedTimeOption.title
            : viewModel.selectedTimeOption.title + " · " + viewModel.eventLocation
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: Spacing.xs) {

                Text("Send the link")
                    .font(AppFont.title1)
                    .foregroundStyle(AppColors.Text.primary)

                Text("No signup for them. They tap, they answer.")
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.secondary)
            }
            .padding(.top, Spacing.xl)

            whatsAppPreview
                .padding(.top, Spacing.xl)

            Spacer(minLength: Spacing.xxl)
            
            VStack(spacing: Spacing.xs) {
                HStack {
                    Image(systemName: "link")
                    
                    Text(viewModel.inviteLink)
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Button {
                            copyLink()
                    } label: {
                        HStack {
                            Image(systemName: "document.on.document")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .tint(AppColors.Brand.primary)
                            Text("Copy")
                                .font(AppFont.caption.bold())
                                .foregroundStyle(AppColors.Brand.primary)
                        }
                        .padding(Spacing.sm)
                        .background(AppColors.Brand.soft)
                        .clipShape(RoundedRectangle(cornerRadius: Radius.small))
                        .frame(height: 42)
                    }
                    .buttonStyle(.plain)
                }
                .padding(Spacing.xs)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                .overlay {
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .stroke(AppColors.Text.tertiary)
                }

                
                ShareLink(
                    item: viewModel.inviteLink,
                    message: Text(shareMessage)
                ) {
                    Text("Send to group")
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(AppColors.Brand.primary)
                        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
                }

                Button {
                    onFinish()
                } label: {
                    Text("Done")
                        .font(AppFont.caption.bold())
                        .foregroundStyle(AppColors.Text.secondary)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, Spacing.screenPadding)
        .padding(.bottom, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.Background.subtle)
        .overlay(alignment: .bottom) {

            if showCopiedToast {
                Toast(title: "Link copied", style: .success)
                    .padding(.horizontal, Spacing.screenPadding)
                    .padding(.bottom, Spacing.xl)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }

    private var whatsAppPreview: some View {

        VStack(alignment: .leading, spacing: Spacing.sm) {

            Text("WHATSAPP PREVIEW")
                .font(AppFont.label)
                .foregroundStyle(Color(red: 0.29, green: 0.62, blue: 0.42))

            VStack(alignment: .leading, spacing: Spacing.sm) {

                HStack(spacing: Spacing.sm) {

                    Text(viewModel.activitySelection?.emoji ?? "🎯")
                        .font(.system(size: 24))

                    VStack(alignment: .leading, spacing: 2) {

                        Text(viewModel.groupName.isEmpty ? "Your group" : viewModel.groupName)
                            .font(AppFont.bodyStrong)
                            .foregroundStyle(AppColors.Text.primary)

                        Text(locationSubtitle)
                            .font(AppFont.caption)
                            .foregroundStyle(AppColors.Text.secondary)
                            .lineLimit(1)
                    }
                }

                Text(shareMessage)
                    .font(AppFont.body)
                    .foregroundStyle(AppColors.Text.primary)

                Text(viewModel.inviteLink)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Brand.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 38)
                    .background(AppColors.Brand.soft)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            }
            .padding(Spacing.md)
            .background(AppColors.Background.card)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
            .shadow(color: .black.opacity(0.06), radius: 20, y: 6)
        }
        .padding(Spacing.md)
        .background(Color(red: 0.91, green: 0.965, blue: 0.925))
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private func copyLink() {

        #if canImport(UIKit)
        UIPasteboard.general.string = viewModel.inviteLink
        #endif

        withAnimation(.easeOut(duration: 0.2)) {
            showCopiedToast = true
        }

        Task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeOut(duration: 0.2)) {
                showCopiedToast = false
            }
        }
    }
}

