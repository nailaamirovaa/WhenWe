//
//  NotificationCell.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct NotificationCell: View {
    
    var title: String
    var subtitle: String
    var toggle: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: Spacing.xxs) {
                Text(title)
                    .font(AppFont.bodyStrong)
                    .foregroundStyle(AppColors.Text.primary)
                
                Text(subtitle)
                    .font(AppFont.label)
                    .foregroundStyle(AppColors.Text.tertiary)
            }
            
            Spacer()
            
            
            
        }
    }
}
