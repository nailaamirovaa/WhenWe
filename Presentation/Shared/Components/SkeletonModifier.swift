//
//  SkeletonModifier.swift
//  WhenWe
//
//  Created by Naila Amirova on 20.07.26.
//

import SwiftUI

struct SkeletonModifier: ViewModifier {

    let isLoading: Bool

    func body(content: Content) -> some View {

        if isLoading {
            content
                .redacted(reason: .placeholder)
                .shimmering()
        } else {
            content
        }
    }
}

extension View {

    func skeleton(_ loading: Bool) -> some View {
        modifier(
            SkeletonModifier(isLoading: loading)
        )
    }
}
