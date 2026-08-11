//
//  NameSetupView.swift
//  WhenWe
//
//  Created by Naila Amirova on 07.08.26.
//

import SwiftUI
import Foundation

struct NameSetupView: View {
    
    @Environment(AppRouter.self) private var router
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: Spacing.sm) {
                
                BackButton {
                    router.route = .signIn
                }
                
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    
                    Text("What should we call you?")
                        .font(AppFont.title1)
                        .foregroundStyle(AppColors.Text.primary)
                    
                    Text("Your group sees this next to your RSVP.")
                        .font(AppFont.body)
                        .foregroundStyle(AppColors.Text.secondary)
                }
                .padding(.top, Spacing.xl)
                
                HStack {
                    Spacer()
                    
                    HStack(alignment: .bottom,spacing: -24) {
                        ZStack {
                            Circle()
                                .fill(AppColors.Brand.soft)
                                .frame(width: 88, height: 88)
                                .overlay {
                                    Circle()
                                        .stroke(AppColors.Brand.border, lineWidth: 1)
                                }
                            
                            Text(
                                viewModel.name
                                .split(separator: " ")
                                .compactMap { $0.first }
                                .map { String($0) }
                                .joined()
                            )
                                .font(AppFont.display)
                                .foregroundStyle(AppColors.Brand.primary)
                        }
                        
                        Button {
                            // add photo
                        } label: {
                            Image(AppIcons.uploadPhoto)
                                .resizable()
                                .frame(width: 14, height: 14)
                                .padding(6)
                                .background(AppColors.Brand.primary)
                                .clipShape(
                                    Circle()
                                )
                                .overlay {
                                    Circle()
                                        .stroke(.clear, lineWidth: 3)
                                }
                                .offset(y:-2)
                        }
                    }
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text("FULL NAME")
                        .font(AppFont.label)
                        .foregroundStyle(AppColors.Text.tertiary)
                    
                    AppTextField(placeholder: "Type your name", text: $viewModel.name)
                    
                    Text("Real names keep the group honest — use whatever your teammates know you by.")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColors.Text.tertiary)
                }
                
                Spacer()
                
                PrimaryButton(title: "Start playing") {
                    Task {
                        /*
                        if await viewModel.changeName(fullName: viewModel.name) != nil {
                            router.completedNameSetup()
                        }
                         */
                        router.completedNameSetup()
                    }
                }
                .disabled(viewModel.name.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(Spacing.screenPadding)
        }
        .background(AppColors.Background.base)
    }
}
