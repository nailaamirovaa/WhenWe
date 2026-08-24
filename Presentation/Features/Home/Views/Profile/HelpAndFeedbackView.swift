//
//  HelpAndFeedbackView.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.08.26.
//

import SwiftUI

struct HelpAndFeedbackView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    @State private var viewModel = HelpAndFeedbackViewModel()

    @State private var query = ""
    @State private var isFeatureRequest = false
    @State private var ticketType = "bug"
    @State private var subject = ""
    @State private var messageBody = ""
    @State private var toast: (title: String, style: ToastStyle)?

    private let ticketTypes: [(value: String, title: String)] = [
        ("bug", "Bug"), ("question", "Question"), ("other", "Other")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.md) {
                PrimaryHeader(title: "Help & Feedback", onBack: { dismiss() })

                AppTextField(placeholder: "Search help articles", text: $query)
                    .onSubmit {
                        Task { await viewModel.loadArticles(query: query.isEmpty ? nil : query) }
                    }

                articlesSection

                contactSection
            }
            .padding(Spacing.screenPadding)
        }
        .background(AppColors.Background.subtle)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .overlay(alignment: .bottom) {
            if let toast {
                Toast(title: toast.title, style: toast.style)
                    .padding(.horizontal, Spacing.screenPadding)
                    .padding(.bottom, Spacing.xl)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .task { await viewModel.loadArticles() }
    }

    @ViewBuilder
    private var articlesSection: some View {
        if viewModel.isLoadingArticles {
            ProgressView()
                .frame(maxWidth: .infinity)
                .padding(.vertical, Spacing.md)
        } else if !viewModel.articles.isEmpty {
            VStack(spacing: 0) {
                ForEach(viewModel.articles) { article in
                    articleRow(article)

                    if article.id != viewModel.articles.last?.id {
                        Divider()
                    }
                }
            }
            .background(AppColors.Background.card)
            .clipShape(RoundedRectangle(cornerRadius: Radius.large))
        }
    }

    private func articleRow(_ article: SupportArticle) -> some View {
        Button {
            guard let url = URL(string: article.url) else { return }
            openURL(url)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(article.title)
                        .font(AppFont.bodyStrong)
                        .foregroundStyle(AppColors.Text.primary)

                    Text(article.summary)
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.secondary)
                        .lineLimit(2)
                }

                Spacer()

                Image(systemName: AppIcons.chevronRight)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(AppColors.Text.tertiary)
            }
            .padding(Spacing.md)
        }
        .buttonStyle(.plain)
    }

    private var contactSection: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Text("STILL NEED HELP?")
                .font(AppFont.label)
                .foregroundStyle(AppColors.Text.tertiary)

            HStack(spacing: Spacing.sm) {
                Chip(title: "Report a problem", icon: nil, style: isFeatureRequest ? .unselected : .selected) {
                    isFeatureRequest = false
                }

                Chip(title: "Suggest a feature", icon: nil, style: isFeatureRequest ? .selected : .unselected) {
                    isFeatureRequest = true
                }
            }

            if !isFeatureRequest {
                HStack(spacing: Spacing.sm) {
                    ForEach(ticketTypes, id: \.value) { type in
                        Chip(title: type.title, icon: nil, style: ticketType == type.value ? .selected : .unselected) {
                            ticketType = type.value
                        }
                    }
                }
            }

            AppTextField(placeholder: "Subject", text: $subject)

            messageEditor

            PrimaryButton(title: isFeatureRequest ? "Send suggestion" : "Submit ticket", state: submitState) {
                Task { await submit() }
            }
        }
        .padding(Spacing.md)
        .background(AppColors.Background.card)
        .clipShape(RoundedRectangle(cornerRadius: Radius.large))
    }

    private var messageEditor: some View {
        TextEditor(text: $messageBody)
            .font(AppFont.caption)
            .foregroundStyle(AppColors.Text.primary)
            .scrollContentBackground(.hidden)
            .frame(height: 120)
            .padding(Spacing.xs)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            .overlay(alignment: .topLeading) {
                if messageBody.isEmpty {
                    Text(isFeatureRequest ? "What would you like to see?" : "Tell us what's going on")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.tertiary)
                        .padding(.horizontal, Spacing.sm + 4)
                        .padding(.vertical, Spacing.sm + 8)
                        .allowsHitTesting(false)
                }
            }
    }

    private var submitState: PrimaryButtonState {
        if viewModel.isSubmitting { return .loading }
        return subject.isEmpty || messageBody.isEmpty ? .disabled : .normal
    }

    private func submit() async {
        let success = isFeatureRequest
            ? await viewModel.submitFeatureSuggestion(subject: subject, body: messageBody)
            : await viewModel.submitTicket(type: ticketType, subject: subject, body: messageBody)

        withAnimation(.easeOut(duration: 0.2)) {
            toast = success
                ? ("Thanks — we got it", .success)
                : ("Couldn't send. Try again.", .error)
        }

        if success {
            subject = ""
            messageBody = ""
        }

        Task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeOut(duration: 0.2)) { toast = nil }
        }
    }
}

#Preview {
    HelpAndFeedbackView()
}
