//
//  CustomToggleStyle.swift
//  WhenWe
//
//  Created by Naila Amirova on 19.08.26.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            RoundedRectangle(cornerRadius: Radius.pill)
                .fill(configuration.isOn ? AppColors.Brand.primary : Color.gray.opacity(0.3))
                .frame(width: 54, height: 34)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(2)
                        .offset(x: configuration.isOn ? 8 : -8)
                        .animation(.spring(response: 0.2), value: configuration.isOn)
                )
        }
        .buttonStyle(.plain)
    }
}
