//
//  CustomTabBar.swift
//  WhenWe
//
//  Created by Naila Amirova on 21.07.26.
//

import SwiftUI

struct CustomTabBar: View {

    @Binding var selectedTab: AppTab

    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
            
            HStack(spacing: 70) {
                
                tabButton(.groups, "circle.dotted.and.circle")
                tabButton(.upcoming, "square")
                tabButton(.profile, "circle")
            }
            .padding(.bottom, 0)
            .padding()
        }
        .background(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }

    @ViewBuilder
    func tabButton(_ tab: AppTab, _ image: String) -> some View {

        Button {

            selectedTab = tab

        } label: {

            VStack(spacing: 3) {
                Image(systemName: image)
                    .font(.title3)
                    .foregroundStyle(selectedTab == tab ? .brandPrimary : .gray)
                Text(tab.title)
                    .font(AppFont.subLabel)
                    .foregroundStyle(selectedTab == tab ? .brandPrimary : .gray)
            }
        }
    }
}
