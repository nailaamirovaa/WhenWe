//
//  GroupPickerView.swift
//  WhenWe
//
//  Created by Naila Amirova on 14.08.26.
//

import Foundation
import SwiftUI


struct GroupPickerView: View {
    @State private var selectedGroup: Groups
    var groups: [Groups]
    @Binding var isExpanded: Bool
    var onSelect: (Groups) -> Void

    init(groups: [Groups], isExpanded: Binding<Bool>, onSelect: @escaping (Groups) -> Void) {
        self.groups = groups
        self.selectedGroup = groups[0]
        self._isExpanded = isExpanded
        self.onSelect = onSelect
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation(.snappy) { isExpanded.toggle() }
            }) {
                HStack(spacing: Spacing.xs) {
                    Image(systemName: AppIcons.profile)
                        .resizable()
                        .padding(Spacing.xxs)
                        .background(AppColors.Brand.primary)
                        .clipShape(RoundedRectangle(cornerRadius: Radius.small))
                        .frame(width: 36, height: 36)
                    
                    VStack(alignment: .leading, spacing: Spacing.xxs) {
                        Text("GROUP")
                            .font(AppFont.label)
                            .foregroundStyle(AppColors.Text.tertiary)
                        Text("Choose your group")
                            .font(AppFont.bodyStrong)
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundStyle(AppColors.Text.tertiary)                }
                .padding()
                .background(AppColors.Background.card)
            }
            .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.small)
                    .strokeBorder(AppColors.Border.default, lineWidth: 1.5)
            )
            .overlay(alignment: .top) {
                if isExpanded {
                    VStack(spacing: 0) {
                        ForEach(groups) { option in
                            Button {
                                selectedGroup = option
                                onSelect(selectedGroup)
                                
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isExpanded = false
                                }
                            } label: {
                                HStack(spacing: Spacing.xs) {
                                    Image(AppIcons.google)
                                        .resizable()
                                        .padding(Spacing.xxs)
                                        .background(AppColors.Brand.primary)
                                        .clipShape(RoundedRectangle(cornerRadius: Radius.small))
                                        .frame(width: 35, height: 36)
                                    
                                    Text(option.name)
                                        .font(AppFont.bodyStrong)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                            }
                            Divider()
                        }
                    }
                    .background(AppColors.Background.card)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .offset(y: 80)
                    .zIndex(1)
                    .transition(.identity)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

